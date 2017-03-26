// WebUploader实例
var uploader;

// 添加的文件数量
var fileCount;
// 添加的文件总大小
var fileSize;
jQuery(function() {
    var $ = jQuery, // just in case. Make sure it's not an other libaray.

        $wrap = $('#uploader'),
        // 图片容器
        $queue = $('<ul class="filelist"></ul>')
        .appendTo($wrap.find('.queueList')),
        // 状态栏，包括进度和控制按钮
        $statusBar = $wrap.find('.statusBar'),
        // 文件总体选择信息。
        $info = $statusBar.find('.info'),
        // 上传按钮
        $upload = $wrap.find('.uploadBtn'),
        // 没选择文件之前的内容。
        $placeHolder = $wrap.find('.placeholder'),
        // 总体进度条
        $progress = $statusBar.find('.progress').hide(),
        // 添加的文件数量
        fileCount = 0,
        // 添加的文件总大小
        fileSize = 0,
        // 优化retina, 在retina下这个值是2
        ratio = window.devicePixelRatio || 1,

        // 缩略图大小
        thumbnailWidth = 110 * ratio,
        thumbnailHeight = 110 * ratio,

        // 可能有pedding, ready, uploading, confirm, done.
        state = 'pedding',

        // 所有文件的进度信息，key为file id
        percentages = {},

        supportTransition = (function() {
            var s = document.createElement('p').style,
                r = 'transition' in s ||
                'WebkitTransition' in s ||
                'MozTransition' in s ||
                'msTransition' in s ||
                'OTransition' in s;
            s = null;
            return r;
        })();


    if (!WebUploader.Uploader.support()) {
        alert('Web Uploader 不支持您的浏览器！如果你使用的是IE浏览器，请尝试升级 flash 播放器');
        throw new Error('WebUploader does not support the browser you are using.');
    }

    var fileMd5;
    var filename;
    var md5Value;
    //监听分块上传过程中的三个时间点
    WebUploader.Uploader.register({
        "before-send-file": "beforeSendFile",
        "before-send": "beforeSend",
        "after-send-file": "afterSendFile",
    }, {
        //时间点1：所有分块进行上传之前调用此函数
        beforeSendFile: function(file) {
            var deferred = WebUploader.Deferred();
            //1、计算文件的唯一标记，用于断点续传
            (new WebUploader.Uploader()).md5File(file, 0, 10 * 1024 * 1024)
                .progress(function(percentage) {
                    //$('#item1').find("p.state").text("正在读取文件信息...");
                })
                .then(function(val) {
                    fileMd5 = val;
                    filename = file.name;
                    //$('#item1').find("p.state").text("成功获取文件信息...");
                    //获取文件信息后进入下一步
                    deferred.resolve();
                });
            return deferred.promise();
        },
        //时间点2：如果有分块上传，则每个分块上传之前调用此函数
        beforeSend: function(block) {
            var deferred = WebUploader.Deferred();

            $.ajax({
                type: "POST",
                url: "/Video?action=checkChunk",
                data: {
                    //文件唯一标记
                    fileMd5: fileMd5,
                    //当前分块下标
                    chunk: block.chunk,
                    //当前分块大小
                    chunkSize: block.end - block.start
                },
                dataType: "json",
                success: function(response) {
                    if (response.ifExist) {
                        //分块存在，跳过
                        deferred.reject();
                    } else {
                        //分块不存在或不完整，重新发送该分块内容
                        deferred.resolve();
                    }
                }
            });

            this.owner.options.formData.fileMd5 = fileMd5;
            deferred.resolve();
            return deferred.promise();
        },
        //时间点3：所有分块上传成功后调用此函数
        afterSendFile: function(file) {
            //如果分块上传成功，则通知后台合并分块
            console.log(file.name);
            (new WebUploader.Uploader()).md5File(file, 0, 10 * 1024 * 1024)
                .progress(function(percentage) {
                })
                .then(function(val) {
                    console.log(val);
                    md5Value = val;
                    $.ajax({
                        type: "POST",
                        url: "/Video?action=mergeChunks",
                        data: {
                            fileMd5: md5Value,
                            filename: file.name,
                        },
                        success: function(response) {
                            //alert("上传成功");
                            //var path = "uploads/"+fileMd5+".mp4";
                            //$("#item1").attr("src",path);
                        }
                    });
                });
        }
    });


    var _$modal = $('#video_upload');
    _$modal.css('display', 'block');
    _$modal.addClass("webuploader-element-invisible");

    // 实例化
    uploader = WebUploader.create({
        pick: {
            id: '#filePicker',
            label: '点击选择视频'
        },
        dnd: '#uploader .queueList',
        paste: document.body,

        accept: {
            title: 'Image',
            extensions: 'mp4,flv,wmv,mov,3gp,asf,asx',
            mimeTypes: 'video/*,application/x-mplayer2'
        },

        // swf文件路径
        swf: 'http://localhost:8080/assets/webuploader-0.1.5/Uploader.swf',

        disableGlobalDnd: true,

        chunked: true,
        // server: 'http://webuploader.duapp.com/server/fileupload.php',
        //server: 'http://2betop.net/fileupload.php',
        server: '/UploadVideo',
        fileNumLimit: 300,
        fileSizeLimit: 2 * 1024 * 1024 * 1024, // 200 M
        fileSingleSizeLimit: 1024 * 1024 * 1024 // 50 M
    });

    // 添加“添加文件”的按钮，
    uploader.addButton({
        id: '#filePicker2',
        label: '继续添加'
    });
    // 当有文件添加进来时执行，负责view的创建
    function addFile(file) {
        var $li = $('<li id="' + file.id + '">' +
                '<p class="title">' + file.name + '</p>' +
                '<p class="imgWrap"></p>' +
                '<p class="progress"><span></span></p>' +
                '</li>'),

            $btns = $('<div class="file-panel">' +
                '<span class="cancel">删除</span>').appendTo($li),
            $prgress = $li.find('p.progress span'),
            $wrap = $li.find('p.imgWrap'),
            $info = $('<p class="error"></p>'),

            showError = function(code) {
                switch (code) {
                    case 'exceed_size':
                        text = '文件大小超出';
                        break;

                    case 'interrupt':
                        text = '上传暂停';
                        break;

                    default:
                        text = '上传失败，请重试';
                        break;
                }

                $info.text(text).appendTo($li);
            };

        if (file.getStatus() === 'invalid') {
            showError(file.statusText);
        } else {
            // @todo lazyload
            $wrap.text('预览中');
            uploader.makeThumb(file, function(error, src) {
                if (error) {
                    $wrap.text('');
                    return;
                }

                var img = $('<img src="' + src + '">');
                $wrap.empty().append(img);
            }, thumbnailWidth, thumbnailHeight);

            percentages[file.id] = [file.size, 0];
            file.rotation = 0;
        }

        file.on('statuschange', function(cur, prev) {
            if (prev === 'progress') {
                $prgress.hide().width(0);
            } else if (prev === 'queued') {
                $li.off('mouseenter mouseleave');
                $btns.remove();
            }

            // 成功
            if (cur === 'error' || cur === 'invalid') {
                console.log(file.statusText);
                showError(file.statusText);
                percentages[file.id][1] = 1;
            } else if (cur === 'interrupt') {
                showError('interrupt');
            } else if (cur === 'queued') {
                percentages[file.id][1] = 0;
            } else if (cur === 'progress') {
                $info.remove();
                $prgress.css('display', 'block');
            } else if (cur === 'complete') {
                $li.append('<span class="success"></span>');
            }

            $li.removeClass('state-' + prev).addClass('state-' + cur);
        });

        $li.on('mouseenter', function() {
            $btns.stop().animate({ height: 30 });
        });

        $li.on('mouseleave', function() {
            $btns.stop().animate({ height: 0 });
        });

        $btns.on('click', 'span', function() {
            var index = $(this).index(),
                deg;

            switch (index) {
                case 0:
                    uploader.removeFile(file);
                    return;

                case 1:
                    file.rotation += 90;
                    break;

                case 2:
                    file.rotation -= 90;
                    break;
            }

            if (supportTransition) {
                deg = 'rotate(' + file.rotation + 'deg)';
                $wrap.css({
                    '-webkit-transform': deg,
                    '-mos-transform': deg,
                    '-o-transform': deg,
                    'transform': deg
                });
            } else {
                $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                // use jquery animate to rotation
                // $({
                //     rotation: rotation
                // }).animate({
                //     rotation: file.rotation
                // }, {
                //     easing: 'linear',
                //     step: function( now ) {
                //         now = now * Math.PI / 180;

                //         var cos = Math.cos( now ),
                //             sin = Math.sin( now );

                //         $wrap.css( 'filter', "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + ",M12=" + (-sin) + ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')");
                //     }
                // });
            }


        });

        $li.appendTo($queue);
    }

    // 负责view的销毁
    function removeFile(file) {
        var $li = $('#' + file.id);

        delete percentages[file.id];
        updateTotalProgress();
        $li.off().find('.file-panel').off().end().remove();
    }

    function updateTotalProgress() {
        var loaded = 0,
            total = 0,
            spans = $progress.children(),
            percent;

        $.each(percentages, function(k, v) {
            total += v[0];
            loaded += v[0] * v[1];
        });

        percent = total ? loaded / total : 0;

        spans.eq(0).text(Math.round(percent * 100) + '%');
        spans.eq(1).css('width', Math.round(percent * 100) + '%');
        updateStatus();
    }

    function updateStatus() {
        var text = '',
            stats;

        if (state === 'ready') {
            text = '选中' + fileCount + '个视频，共' +
                WebUploader.formatSize(fileSize) + '。';
        } else if (state === 'confirm') {
            stats = uploader.getStats();
            if (stats.uploadFailNum) {
                text = '已成功上传' + stats.successNum + '个视频，' +
                    stats.uploadFailNum + '个视频上传失败，<a class="retry" href="#">重新上传</a>失败视频或<a class="ignore" href="#">忽略</a>'
            }

        } else {
            stats = uploader.getStats();
            text = '共' + fileCount + '个（' +
                WebUploader.formatSize(fileSize) +
                '），已上传' + stats.successNum + '个';

            if (stats.uploadFailNum) {
                text += '，失败' + stats.uploadFailNum + '个';
            }
        }

        $info.html(text);
    }

    function setState(val) {
        var file, stats;

        if (val === state) {
            return;
        }

        $upload.removeClass('state-' + state);
        $upload.addClass('state-' + val);
        state = val;

        switch (state) {
            case 'pedding':
                $placeHolder.removeClass('element-invisible');
                $queue.parent().removeClass('filled');
                $queue.hide();
                $statusBar.addClass('element-invisible');
                uploader.refresh();
                break;

            case 'ready':
                $placeHolder.addClass('element-invisible');
                $('#filePicker2').removeClass('element-invisible');
                $queue.parent().addClass('filled');
                $queue.show();
                $statusBar.removeClass('element-invisible');
                uploader.refresh();
                break;

            case 'uploading':
                $('#filePicker2').addClass('element-invisible');
                $progress.show();
                $upload.text('暂停上传');
                break;

            case 'paused':
                $progress.show();
                $upload.text('继续上传');
                break;

            case 'confirm':
                $progress.hide();
                $upload.text('开始上传').addClass('disabled');

                stats = uploader.getStats();
                if (stats.successNum && !stats.uploadFailNum) {
                    setState('finish');
                    return;
                }
                break;
            case 'finish':
                stats = uploader.getStats();
                if (stats.successNum) {
                    alert('上传成功');
                } else {
                    // 没有成功的图片，重设
                    state = 'done';
                    location.reload();
                }
                break;
        }

        updateStatus();
    }

    uploader.onUploadProgress = function(file, percentage) {
        var $li = $('#' + file.id),
            $percent = $li.find('.progress span');

        $percent.css('width', percentage * 100 + '%');
        percentages[file.id][1] = percentage;
        updateTotalProgress();
    };

    uploader.onFileQueued = function(file) {
        fileCount++;
        fileSize += file.size;

        if (fileCount === 1) {
            $placeHolder.addClass('element-invisible');
            $statusBar.show();
        }

        addFile(file);
        setState('ready');
        updateTotalProgress();
    };

    uploader.onFileDequeued = function(file) {
        fileCount--;
        fileSize -= file.size;

        if (!fileCount) {
            setState('pedding');
        }

        removeFile(file);
        updateTotalProgress();

    };

    uploader.on('all', function(type) {
        var stats;
        switch (type) {
            case 'uploadFinished':
                setState('confirm');
                break;

            case 'startUpload':
                setState('uploading');
                break;

            case 'stopUpload':
                setState('paused');
                break;

        }
    });

    uploader.onError = function(code) {
        alert('Eroor: ' + code);
    };

    $upload.on('click', function() {
        if ($(this).hasClass('disabled')) {
            return false;
        }

        if (state === 'ready') {
            uploader.upload();
        } else if (state === 'paused') {
            uploader.upload();
        } else if (state === 'uploading') {
            //暂停上传
            uploader.stop(true);
        }
    });

    $info.on('click', '.retry', function() {
        uploader.retry();
    });

    $info.on('click', '.ignore', function() {
        alert('todo');
    });

    $upload.addClass('state-' + state);
    updateTotalProgress();

    _$modal.on('show.bs.modal', function() {
        _$modal.removeClass("webuploader-element-invisible");
    });

    //获取视频列表
    $.post("/getVideoList.action", {},
        function(data, status) {
            var result = data.Result;
            if (result == 'OK') {
                var jsonArray = data.Records;
                for (var i = 0; i < jsonArray.length; ++i) {
                    var oneline = jsonArray[i];
                    row="";
                    if(oneline.transfering==0){
                        row="<article class='white-panel' id='" + oneline.video_id + "' data-index='" + i + "'><div class='play_btn' style='height:80%;'></div><img src='" +
                        oneline.cover_img + "' class='thumb'><div id='v_path" + oneline.video_id + "' style='display: none' >" + oneline.video_path +
                        "</div><div><div class='checkbox checkbox-danger'><input type='checkbox' id='_" + oneline.video_id + "' class='styled'><label for='_" + oneline.video_id + "'>"+oneline.video_name+"</label></div></div></article>"
                    }else{
                        row="<article class='white-panel' id='" + oneline.video_id + "' data-index='" + i + "'><div class='con_img' onclick='transfer_warning()'><img src='"+oneline.cover_img+"' class='thumb'><span class='ms'>正在进行操作...</span></div><div id='v_path" + i + "' style='display: none' >" + oneline.video_path +
                        "</div></article>"
                    }
                    $("#gallery-wrapper").append(row);
                }

                $('article').each(function(i) {
                    $(this).attr('data-index', i);
                    var img = $(this).find('.play_btn');
                    img.on('click', showModal);
                });
            }
            //alert(data.Records);
        });
});


function showModal() {
    var index = $(this).parent('article').attr('id');
    var src = $('#v_path' + index).text();
    var pic = $(this).attr('src');

    type = src.substr(src.lastIndexOf(".")+1);
    if(type != 'mp4'){
        x0p("提示","暂不支持"+type+"格式！请先转换视频格式为MP4。","error");
        return;
    }


    $('#myModal').modal('show');
    var dp = new DPlayer({
        element: document.getElementById('video_player'), // Optional, player element
        autoplay: false, // Optional, autoplay video, not supported by mobile browsers
        theme: '#FADFA3', // Optional, theme color, default: #b7daff
        loop: true, // Optional, loop play music, default: true
        lang: 'zh', // Optional, language, `zh` for Chinese, `en` for English, default: Navigator language
        screenshot: true, // Optional, enable screenshot function, default: false, NOTICE: if set it to true, video and video poster must enable Cross-Origin
        hotkey: true, // Optional, binding hot key, including left right and Space, default: true
        preload: 'auto', // Optional, the way to load music, can be 'none' 'metadata' 'auto', default: 'auto'
        video: { // Required, video info
            url: src, // Required, video link
            pic: pic, // Optional, video poster
            type: 'auto' // Optional, video type, `flv` for flv format, `hls` for m3u8 format, `normal` for mp4 ogg and webm format, `auto` for automatic detection, default: `auto`
        },
    });

    $('#myModal').on('hidden.bs.modal', function() {
        $('#myModal .modal-body .dplayer').html('');
    });
}

function closeUploader() {
    // 移除所有缩略图并将上传文件移出上传序列
    for (var i = 0; i < uploader.getFiles().length; i++) {
        // 将图片从上传序列移除
        uploader.removeFile(uploader.getFiles()[i]);
        //uploader.removeFile(uploader.getFiles()[i], true);
        //delete uploader.getFiles()[i];
        // 将图片从缩略图容器移除
        var $li = $('#' + uploader.getFiles()[i].id);
        $li.off().remove();
    }

    //setState('pedding');

    // 重置文件总个数和总大小
    fileCount = 0;
    fileSize = 0;
    // 重置uploader，目前只重置了文件队列
    uploader.reset();
    // 更新状态等，重新计算文件总个数和总大小
    //updateStatus();
}

function transfer_warning(){
    x0p("提示","该视频正在添加水印，无法播放");
}
