<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>${dpm_name}管理</title>

   <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
   <link href="./assets/css/styles.css" rel="stylesheet">
   <link href="./assets/x0popup/css/x0popup.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="./assets/js/html5shiv.js"></script>
    <script src="./assets/js/respond.min.js"></script>
    <![endif]-->
    <script src="./assets/js/jquery-1.11.1.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/x0popup/js/x0popup.min.js"></script>

    <script type="text/javascript">
       $(document).ready(function() {
        var p_dpm = ${dpm_id};
        $.post("/getProcessList.action",
        {
            p_dpm : p_dpm
        },
        function(data,status){
            var result = data.Result;
            if(result=='OK'){
                var jsonArray = data.Records;
                for(var i=0;i<jsonArray.length;++i){
                    var oneline = jsonArray[i];
                    p_id=  oneline.p_id;
                    p_name = oneline.p_name;
                    p_content = oneline.p_content;
                    if(p_content.length>15){
                        p_content = p_content.substr(0,15)+"...";
                    }
                    update_time = oneline.update_time;
                    $("#process_table").append("<tr><td id='p_id"+p_id+"'>"+p_id+"<td>"+p_name+
                        "</td><td>"+p_content+
                        "</td><td>"+update_time+"</td><td><button class='btn btn-primary' onclick='showModifyModal("+p_id+ ")'>修改</button></td> <td><button class='btn btn-success' onclick='deleteProcess("+p_id+")'>删除</button></td> </tr>");
                }
                $("#process_table").append("<div id='p_dpm' style='display:none'>"+p_dpm+"</div>")
            }
        });
    });
</script>
</head>

<body>
    <%@include file="./navbar.jsp"%>
    <%@include file="./sidebar.jsp"%>

    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="active">${dpm_name}管理</li>
            </ol>
        </div><!--/.row-->

        <div class="row">
            <div class="col-lg-12">
            </div>
        </div><!--/.row-->


        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        流程列表
                    </div>
                    <div class="panel-body">
                        <table class="table" id="process_table">
                            <thead id ="table_content">
                                <tr>
                                    <th>流程ID</th>
                                    <th>流程名</th>
                                    <th>流程内容</th>
                                    <th>更新时间</th>
                                    <th>修改信息</th>
                                    <th>删除流程</th>
                                </tr>
                            </thead>
                        </table>
                        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">增加流程</button>
                    </div>
                </div>


            </div>
        </div><!--/.row-->


    </div>	<!--/.main-->

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    增加流程
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                    <table class="table">
                        <tr>
                            <td>流程名</td>
                            <td><input class = 'form-control' id="p_name_new"/></td>
                        </tr>
                        <tr>
                            <td>流程内容</td>
                            <td>
                                <textarea class='form-control' id="p_content_new" /></textarea>
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary" onclick="addProcess()">
                提交
            </button>
        </div>
    </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!-- 添加图片模态框 -->
<div class="modal fade" id="pic_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    选择图片
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                    <table class="table" id="pic_table">

                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="pic_upload_button">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="video_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    选择视频
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                    <table class="table" id="video_table">

                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="video_upload_button">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="modiModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">×
            </button>
            <h4 class="modal-title">
                修改流程
            </h4>
        </div>
        <div class="modal-body">
            <div class = "row">
                <ul  class="nav nav-tabs">
                    <li class="active">
                        <a href="#info_tab" data-toggle="tab">
                            流程信息
                        </a>
                    </li>
                    <li><a href="#image_tab" data-toggle="tab">流程图片</a></li>
                    <li><a href="#video_tab" data-toggle="tab">流程视频</a></li>
                </ul>
                <div  class="tab-content">
                    <div class="tab-pane fade in active" id="info_tab">
                        <table class="table">
                            <tr>
                                <td>流程名</td>
                                <td><input class = 'form-control' id="p_name_modi"/></td>
                            </tr>
                            <tr>
                                <td>流程内容</td>
                                <td>
                                    <textarea class='form-control' id="p_content_modi" /></textarea>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="tab-pane fade" id="image_tab">
                        <div class = "row">
                            <table class="table">
                                <tr>
                                    <td>图片</td>
                                    <td id="p_pic_list">
                                    </td>
                                </tr>
                                <tr>
                                    <td>选择图片</td>
                                    <td>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <button class="btn btn-primary" id="p_choose_pic_button">选择图片</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="video_tab">
                        <div class = "row">
                            <table class="table">
                                <tr>
                                    <td>视频</td>
                                    <td id="p_video_list">
                                    </td>
                                </tr>
                                <tr>
                                    <td>选择视频</td>
                                    <td>
                                        <div class="row">
                                            <div class="col-xs-12">
                                                <button class="btn btn-primary" id="p_choose_video_button">选择视频</button>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-default"
            data-dismiss="modal">关闭
        </button>
        <button type="button" class="btn btn-primary" id="modify_button">
            提交
        </button>
    </div>
</div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script src="./assets/js/sidebar.js"></script>
<script src="./assets/js/process_manage.js"></script>
<script>
    !function ($) {
        $(document).on("click","#basic", function(){
            $('#basic_em').toggleClass("glyphicon-minus");
        });
        $('#basic_em').addClass("glyphicon-plus");
    }(window.jQuery);

    !function ($) {
        $(document).on("click","#role", function(){
            $('#role_em').toggleClass("glyphicon-minus");
        });
        $('#role_em').addClass("glyphicon-plus");
    }(window.jQuery);
    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
</script>
</body>

</html>
