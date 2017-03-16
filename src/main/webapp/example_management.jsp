<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>科室管理</title>
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="./assets/css/styles.css" rel="stylesheet">
    <link href="./assets/x0popup/css/x0popup.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="./assets/js/html5shiv.js"></script>
    <script src="./assets/js/respond.min.js"></script>
    <![endif]-->
    <script src="./assets/js/jquery-1.11.1.min.js"></script>
    <script src="./assets/x0popup/js/x0popup.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
        //获取case列表
        $.post("/getCaseList.action",
        {

        },
        function(data,status){
            var result = data.Result;
            if(result == 'OK'){
                var jsonArray = data.Records;
                for(i=0;i<jsonArray.length;++i){
                    var reception_des = jsonArray[i].reception_des;
                    if(reception_des.length>15){
                        reception_des = reception_des.substr(0,15)+"...";
                    }
                    var examination_des = jsonArray[i].examination_des;
                    if(examination_des.length>15){
                        examination_des = examination_des.substr(0,15)+"...";
                    }
                    var diagnosis_des = jsonArray[i].diagnosis_des;
                    if(diagnosis_des.length>15){
                        diagnosis_des = diagnosis_des.substr(0,15)+"...";
                    }
                    var treatment_des = jsonArray[i].treatment_des;
                    if(treatment_des.length>15){
                        treatment_des = treatment_des.substr(0,15)+"...";
                    }
                    $("#table_content").append("<tr><td>"+jsonArray[i].casetype_id+"/<td><td>"+jsonArray[i].case_name+"</td><td>"+reception_des+"</td><td>"+examination_des+"</td><td>"+diagnosis_des+"</td><td>"+treatment_des+"</td><td>"+jsonArray[i].update_time+"</td><td><button class='btn btn-primary btn-lg' data-toggle='modal' onclick='main("+jsonArray[i].case_id+")'>修改</button></td></tr>");
                }
            }
        });
        //获取caseType列表
        $.post("/getCaseTypeList.action", {},
            function(data, status) {
                var result = data.Result;
                if (result == 'OK') {
                    var jsonArray = data.Records;
                    for (var i = 0; i < jsonArray.length; ++i) {
                        var oneline = jsonArray[i];
                        $("#type_content").append("<tr><td id='type_" + oneline.casetype_id + "'>" + oneline.casetype_id + "</td><td id = 'type_name_" + oneline.casetype_id + "'>" + oneline.casetype_name + "</td><td>" + oneline.update_time + "</td><td>" + oneline.status + "</td><td><button class='btn btn-primary' onclick='modifyType(" + oneline.casetype_id + ")'>修改</button></td></tr>");
                    }
                }
            });
    });
</script>
<style type="text/css">
    .modal {
        postion: absolute;
    }
</style>
</head>

<body>
    <%@include file="./navbar.jsp"%>
    <%@include file="./sidebar.jsp"%>
    <div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
        <div class="row">
            <ol class="breadcrumb">
                <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
                <li class="active">病例管理</li>
            </ol>
        </div>
        <!--/.row-->
        <div class="row">
            <div class="col-lg-12">
            </div>
        </div>
        <!--/.row-->
        <div class="row">
            <div class="col-md-12">
                <ul id="myTab" class="nav nav-tabs">
                    <li class="active">
                        <a href="#home" data-toggle="tab">
                            病例管理
                        </a>
                    </li>
                    <li><a href="#caseTypeTab" data-toggle="tab">病例类型管理</a></li>
                </ul>
                <div id="myTabContent" class="tab-content">
                    <div class="tab-pane fade in active" id="home">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                病例列表
                            </div>
                            <div class="panel-body">
                                <table class="table" id="table_content">
                                    <thead>
                                        <tr>
                                            <th>病例类型</th>
                                            <th>病例名称</th>
                                            <th>接诊信息</th>
                                            <th>检查信息</th>
                                            <th>诊断信息</th>
                                            <th>治疗信息</th>
                                            <th>更新时间</th>                                    
                                            <th>修改</th>
                                        </tr>
                                    </thead>
                                </table>
                                <button class="btn btn-primary btn-lg" data-toggle="modal" onclick="showAddModal()">增加病例</button>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="caseTypeTab">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                病例类型列表
                            </div>
                            <div class="panel-body">
                                <table class="table" id="type_content">
                                    <thead>
                                        <tr>
                                            <th>类型ID</th>
                                            <th>类型名称</th>
                                            <th>更新时间</th>
                                            <th>状态</th>
                                            <th>修改</th>
                                        </tr>
                                    </thead>
                                </table>
                                <button class="btn btn-primary btn-lg" data-toggle="modal" onclick="addType()">增加类型</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.row-->
    </div>
    <!--/.main-->
    <div class="modal fade" id="main_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                    aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    病例信息
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <ul  class="nav nav-tabs">
                            <li class="active">
                                <a href="#welcome_tab" data-toggle="tab">
                                    接诊信息
                                </a>
                            </li>
                            <li><a href="#check_tab" data-toggle="tab">检查信息</a></li>
                            <li><a href="#judge_tab" data-toggle="tab">诊断信息</a></li>
                            <li><a href="#cure_tab" data-toggle="tab">治疗信息</a></li>
                            <li><a href="#view_tab" data-toggle="tab">修改信息</a></li>
                        </ul>
                        <div  class="tab-content">
                            <div class="tab-pane fade in active" id="welcome_tab">
                                <div class = "row">
                                    <table class="table">
                                        <tr>
                                            <td>病例名</td>
                                            <td><input class = 'form-control' id="welcome_name" readonly/></td>
                                        </tr>

                                        <tr>
                                            <td>接诊文字</td>
                                            <td><textarea class = 'form-control' id="welcome_text"/></textarea></td>
                                        </tr>

                                        <tr>
                                            <td>接诊图片</td>
                                            <td id="welcome_pic_list">
                                                <div class="row">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>选择图片</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button class="btn btn-primary" id="welcome_choose_pic_button">选择图片</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>接诊视频</td>
                                            <td id="welcome_video_list">
                                                <div class="row">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>选择视频</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button class="btn btn-primary" id="welcome_choose_video_button">选择视频</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>


                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="check_tab">
                                <div class = "row">
                                    <table class="table">
                                        <tr>
                                            <td>病例名</td>
                                            <td><input class = 'form-control' id="check_name" readonly/></td>
                                        </tr>

                                        <tr>
                                            <td>检查文字</td>
                                            <td><textarea class = 'form-control' id="check_text"/></textarea></td>
                                        </tr>

                                        <tr>
                                            <td>检查图片</td>
                                            <td id="check_pic_list">
                                                <div class="row">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>选择图片</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button class="btn btn-primary" id="check_choose_pic_button">选择图片</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>检查视频</td>
                                            <td id="check_video_list">
                                                <div class="row">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>选择视频</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button class="btn btn-primary" id="check_choose_video_button">选择视频</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="judge_tab">
                                <div class = "row">
                                    <table class="table">
                                        <tr>
                                            <td>病例名</td>
                                            <td><input class = 'form-control' id="judge_name" readonly/></td>
                                        </tr>

                                        <tr>
                                            <td>诊断文字</td>
                                            <td><textarea class = 'form-control' id="judge_text"/></textarea></td>
                                        </tr>

                                        <tr>
                                            <td>诊断图片</td>
                                            <td id="judge_pic_list">
                                                <div class="row">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>选择图片</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button class="btn btn-primary" id="judge_choose_pic_button">选择图片</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>诊断视频</td>
                                            <td id="judge_video_list">
                                                <div class="row">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>选择视频</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button class="btn btn-primary" id="judge_choose_video_button">选择视频</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="cure_tab">
                                <div class = "row">
                                    <table class="table">
                                        <tr>
                                            <td>病例名</td>
                                            <td><input class = 'form-control' id="cure_name" readonly/></td>
                                        </tr>

                                        <tr>
                                            <td>治疗文字</td>
                                            <td><textarea class = 'form-control' id="cure_text"/></textarea></td>
                                        </tr>

                                        <tr>
                                            <td>治疗图片</td>
                                            <td id="cure_pic_list">
                                                <div class="row">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>选择图片</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button class="btn btn-primary" id="cure_choose_pic_button">选择图片</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>治疗视频</td>
                                            <td id="cure_video_list">
                                                <div class="row">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>选择视频</td>
                                            <td>
                                                <div class="row">
                                                    <div class="col-xs-12">
                                                        <button class="btn btn-primary" id="cure_choose_video_button">选择视频</button>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="view_tab">
                                <div class = "row">
                                    <table class="table">
                                        <tr>
                                            <td>病例名</td>
                                            <td><input class = 'form-control' id='case_name'/></td>
                                        </tr>
                                        <tr>
                                            <td>病例类型</td>
                                            <td>
                                                <select class="form-control" id="casetype_select_modi">
                                                </select>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary" id="modify_case_button">
                提交
            </button>
        </div>
    </div>
</div>
</div>




<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                </button>
                <h4 class="modal-title">
                    增加病例
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <table class="table">
                        <tr>
                            <td>病例名</td>
                            <td>
                                <input class='form-control' id="case_name_new" />
                            </td>
                        </tr>
                        <tr>
                            <td>病例类型</td>
                            <td>
                                <select class="form-control" id="casetype_select">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>接诊信息</td>
                            <td>
                                <textarea class='form-control' id="reception_des_new"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>检查信息</td>
                            <td>
                                <textarea class='form-control' id="examination_des_new"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>诊断信息</td>
                            <td>
                                <textarea class='form-control' id="diagnosis_des_new"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>治疗信息</td>
                            <td>
                                <textarea class='form-control' id="treatment_des_new"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="addCase()">
                    提交
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<div class="modal fade" id="pic_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    选择图片
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <table class="table" id="pic_table">
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="pic_upload_button">
                    提交
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<div class="modal fade" id="video_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    选择视频
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <table class="table" id="video_table">
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" id="video_upload_button">
                    提交
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!--   新增病例类型模态框     -->
<div class="modal fade" id="add_type_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    增加病例类型
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <table class="table">
                        <tr>
                            <td>病例类型名</td>
                            <td>
                                <input class='form-control' id="new_type_name" />
                            </td>
                        </tr>
                        <tr>
                            <td>病例类型描述</td>
                            <td>
                                <textarea class='form-control' id="new_type_desc"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="new_case_type_submit()">
                    提交
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- 修改病例类型   -->
<div class="modal fade" id="modify_type_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div id="casetype_id" style="display: none;"></div>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    修改病例类型
                </h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <table class="table">
                        <tr>
                            <td>病例类型名</td>
                            <td>
                                <input class='form-control' id="modify_type_name" />
                            </td>
                        </tr>
                        <tr>
                            <td>病例类型描述</td>
                            <td>
                                <textarea class='form-control' id="modify_type_desc"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td>病例状态</td>
                            <td>
                                <select id="status" class="form-control">
                                    <option value="0">删除</option>
                                    <option value="1">创建</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="modify_case_type_submit()">
                    提交
                </button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
    ! function($) {
        $(document).on("click", "#basic", function() {
            $('#basic_em').toggleClass("glyphicon-minus");
        });
        $('#basic_em').addClass("glyphicon-plus");
    }(window.jQuery);

    ! function($) {
        $(document).on("click", "#role", function() {
            $('#role_em').toggleClass("glyphicon-minus");
        });
        $('#role_em').addClass("glyphicon-plus");
    }(window.jQuery);
    $(window).on('resize', function() {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function() {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })
</script>
<script src="./assets/js/case_manage.js"></script>
<script src="./assets/js/case_type_manage.js"></script>
</body>

</html>
