/**
 * Created by Marty Pang on 2017/3/14.
 */
function addProcess() {
    p_name_new = $("#p_name_new").val();
    if (p_name_new.length == 0) {
        x0p("提示", "请输入流程名");
        return;
    }
    p_content_new = $("#p_content_new").val();
    if (p_content_new.length == 0) {
        x0p("提示", "请输入流程内容");
        return;
    }
    p_dpm = $("#p_dpm").text();
    $.post("/addProcess.action", {
            p_name: p_name_new,
            p_dpm : p_dpm,
            p_content: p_content_new,

        },
        function(data, status) {
            if (data == 'true') {
                location.reload();
            }
        });
}

function showModifyModal(id) {
    $.post("/getProcessInfo.action", {
            p_id: id
        },
        function(data, status) {
            $("#p_name_modi").val(data.p_name);
            $("#p_content_modi").val(data.p_content);

            $("#p_pic_list").empty();
            $("#p_video_list").empty();
            //获取已有图片
            img_ids = data.p_img;
            img_filter = '';
            if (img_ids.length > 0) {
                img_filter = "in (" + img_ids.substr(1) + ")"
            } else {
                img_filter = "in (-1)";
                img_ids=0;
            }
            fillPicList(img_filter);

            //获取已有视频
            v_ids = data.p_video;
            v_filter = '';
            if (v_ids.length > 0) {
                v_filter = "in (" + v_ids.substr(1) + ")"
            } else {
                v_filter = "in (-1)";
                v_ids=0;
            }
            fillVideoList(v_filter);

            $("#p_choose_pic_button").attr("onclick", "p_upload_pic(\'" + img_ids + "\'," + id + ")");
            $("#p_choose_video_button").attr("onclick", "p_upload_video(\'" + v_ids + "\'," + id + ")");
            $("#modiModal").modal('show');
            $("#modify_button").attr("onclick", "modifyProcess(" + id + ")");

        });
}

//显示可选图片
function p_upload_pic(img_ids, id) {
    img_filter = '';
    if (img_ids.length > 1) {
        img_filter = "not in (" + img_ids.substr(1) + ")"
    } else {
        img_filter = "not in (-1)";
    }
    fillUpPicList(img_filter);

    $("#modiModal").modal("hide");
    $("#pic_upload_button").attr("onclick", "upload_pic(" + id + ",\'" + img_ids + "\')");
    $("#pic_modal").modal("show");
}

//显示可选视频
function p_upload_video(v_ids, id) {
    v_filter = '';
    if (v_ids.length > 1) {
        v_filter = "not in (" + v_ids.substr(1) + ")"
    } else {
        v_filter = "not in (-1)";
    }
    fillUpVideoList(v_filter);

    $("#modiModal").modal("hide");
    $("#video_upload_button").attr("onclick", "upload_video(" + id + ",\'" + v_ids + "\')");
    $("#video_modal").modal("show");
}

function fillPicList(img_filter) {
    $.post("/getImageListByFilter.action", {
            filter: img_filter
        },
        function(data, status) {
        	jsonArray = data.records;
            for (i = 0; i < jsonArray.length; i += 3) {
                pig_row = '<div class = "row">';
                for (j = 0; j < 3&&i+j<jsonArray.length; j++) {
                    pig_row += '<div class="col-xs-4"><img style="width:100px;height: 100px" class="img-square" src="' + jsonArray[i + j].img_s + '"/><div class="closeLayer"  onClick="alert(1)"><img src="./assets/images/close.jpeg" style="width:15px;height: 15px"/></div></div>';
                }
                pig_row += "</div>";
                $("#p_pic_list").append(pig_row);

            }
        });
}

function fillVideoList(v_filter) {
    $.post("/getVideoListByFilter.action", {
            filter: v_filter
        },
        function(data, status) {
        	jsonArray = data.records;
            for (i = 0; i < jsonArray.length; i += 3) {
                v_row = '<div class = "row">';
                for (j = 0; j < 3&&i+j<jsonArray.length; j++) {
                    v_row += '<div class="col-xs-4"><img style="width:100px;height: 100px" class="img-square" src="' + jsonArray[i + j].cover_img + '"/><div class="closeLayer"  onClick="alert(1)"><img src="./assets/images/close.jpeg" style="width:15px;height: 15px"/></div></div>';
                }
                v_row += "</div>";
                $("#p_video_list").append(v_row);

            }
        });
}

function fillUpPicList(img_filter) {
    $.post("/getImageListByFilter.action", {
            filter: img_filter
        },
        function(data, status) {
        	jsonArray = data.records;
            for (i = 0; i < jsonArray.length; i += 3) {
                pig_row = '<tr>';
                for (j = 0; j < 3&&i+j<jsonArray.length; j++) {
                    pig_row += '<td><input name="pic_box" type="checkbox" value="' + jsonArray[i + j].image_id + '"><img style="width:100px;height: 100px" class="img-square" src="' + jsonArray[i + j].img_s + '"/></td>';
                }
                pig_row += "</tr>";
                $("#pic_table").append(pig_row);
            }
        });
}


function fillUpVideoList(v_filter) {
    $.post("/getVideoListByFilter.action", {
            filter: v_filter
        },
        function(data, status) {
        	jsonArray = data.records;
            for (i = 0; i < jsonArray.length; i += 3) {
                v_row = '<tr>';
                for (j = 0; j < 3&&i+j<jsonArray.length; j++) {
                    v_row += '<td><input name="video_box" type="checkbox" value="' + jsonArray[i + j].video_id + '"><img style="width:100px;height: 100px" class="img-square" src="' + jsonArray[i + j].cover_img + '"/></td>';
                }
                v_row += "</tr>";
                $("#video_table").append(v_row);

            }
        });
}

function upload_pic(id, img_ids) {
    pic_list = "";
    $("input[name='pic_box']:checked").each(function() { //由于复选框一般选中的是多个,所以可以循环输出选中的值
        pic_list = pic_list + "," + ($(this).val());
    });
    if(img_ids.length>1){
    	img_ids = img_ids + pic_list;
    }else{
    	//img_ids = 0;
    	img_ids = pic_list;
    }
    
    $.post("/updatePImage.action", {
            p_id: id,
            p_img: img_ids
        },
        function(data, status) {
            if (data == 'true') {
                $("#pic_modal").modal("hide");
                $("#pic_table").empty();
                pic_list = "";
                showModifyModal(id);              
            }
        });
}

function upload_video(id, v_ids) {
    v_list = "";
    $("input[name='video_box']:checked").each(function() { //由于复选框一般选中的是多个,所以可以循环输出选中的值
        v_list = v_list + "," + ($(this).val());
    });
    if(v_ids.length>1){
    	v_ids = v_ids + v_list;
    }else{
    	v_ids = v_list;
    }
    
    $.post("/updatePVideo.action", {
            p_id : id,
            p_video : v_ids
        },
        function(data, status) {
            if (data == 'true') {
                $("#pic_modal").modal("hide");
                $("#video_table").empty();
                v_list = "";
                showModifyModal(id);              
            }
        });
}

function modifyProcess(id) {
    p_name_modi = $("#p_name_modi").val();
    if (p_name_modi.length == 0) {
        x0p("提示", "请输入流程名");
        return;
    }
    p_content_modi = $("#p_content_modi").val();
    if (p_content_modi.length == 0) {
        x0p("提示", "请输入流程内容");
        return;
    }
    $.post("/updateProcess.action", {
            p_id: id,
            p_name: p_name_modi,
            p_content: p_content_modi,
        },
        function(data, status) {
            if (data == 'true') {
                location.reload();
            }
        });
}

function deleteProcess(id) {
    x0p('Confirmation', 'Are you sure?', 'warning',
        function(button) {
            if (button == 'cancel') {} else {
                $.post("/deleteProcess.action", {
                        p_id: id
                    },
                    function(data, status) {
                        if (data == 'true') {
                            location.reload();
                        }
                    });
            }
        });
}
