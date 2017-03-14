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
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.jsp"><span>宠物</span>医院</a>
                <ul class="user-menu">
                    <li class="dropdown pull-right">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> User <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                            <li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
        <ul class="nav menu">
            <a href="#">
                <li class="parent">
                    <span class="glyphicon glyphicon-list"></span> 用户管理 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right" id='role'></span>
            </a>
            <ul class="children " id="sub-item-1">
                <li>
                    <a class="" href="user_management.jsp">
                        <span class="glyphicon glyphicon-share-alt"></span> 管理员管理
                    </a>
                </li>
                <li>
                    <a class="" href="front_user_management.jsp">
                        <span class="glyphicon glyphicon-share-alt"></span> 前台用户管理
                    </a>
                </li>
            </ul>
            </li>
            <li class="parent ">
                <a href="#">
                    <span class="glyphicon glyphicon-list"></span> 基本结构与功能 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right" id="basic"></span>
                </a>
                <ul class="children " id="sub-item-basic">
                    <li>
                        <a class="" href="./room_management.jsp">
                            <span class="glyphicon glyphicon-share-alt"></span> 科室管理
                        </a>
                    </li>
                    <li>
                        <a class="" href="employee_management.jsp">
                            <span class="glyphicon glyphicon-share-alt"></span> 人员管理
                        </a>
                    </li>
                    <li>
                        <a class="" href="#">
                            <span class="glyphicon glyphicon-share-alt"></span> 药品管理
                        </a>
                    </li>
                    <li>
                        <a class="" href="#">
                            <span class="glyphicon glyphicon-share-alt"></span> 收费管理
                        </a>
                    </li>
                    <li>
                        <a class="" href="#">
                            <span class="glyphicon glyphicon-share-alt"></span> 住院管理
                        </a>
                    </li>
                </ul>
            </li>
            <li class="parent ">
                <a href="#">
                    <span class="glyphicon glyphicon-list"></span> 职能学习 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right" id='role'></span>
                </a>
                <ul class="children " id="sub-item-role">
                    <li>
                        <a class="" href="#">
                            <span class="glyphicon glyphicon-share-alt"></span> 角色扮演管理
                        </a>
                    </li>
                    <li>
                        <a class="" href="#">
                            <span class="glyphicon glyphicon-share-alt"></span> 病例学习管理
                        </a>
                    </li>
                </ul>
            </li>
            <li class=""><a href="/example_management.jsp"><span class="glyphicon glyphicon-dashboard"></span> 病例管理</a></li>
            <li role="presentation" class="divider"></li>
        </ul>
    </div>
    <!--/.sidebar-->
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
                                            <th>状态</th>
                                            <th>修改</th>
                                        </tr>
                                    </thead>
                                    <tr>
                                        <td id="case_type_1">没病装病</td>
                                        <td id="case_name_1">头晕</td>
                                        <td>
                                            <button class="btn btn-primary" onclick="welcome(1)">查看</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-danger" onclick="check(1)">查看</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-warning" onclick="judge(1)">查看</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-success" onclick="cure(1)">查看</button>
                                        </td>
                                        <td>失效</td>
                                        <td>
                                            <button class="btn btn-default" onclick="view(1)">修改</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="case_type_2">小病</td>
                                        <td id="case_name_2">腹泻</td>
                                        <td>
                                            <button class="btn btn-primary" onclick="welcome(2)">查看</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-danger" onclick="check(2)">查看</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-warning" onclick="judge(2)">查看</button>
                                        </td>
                                        <td>
                                            <button class="btn btn-success" onclick="cure(2)">查看</button>
                                        </td>
                                        <td>有效</td>
                                        <td>
                                            <button class="btn btn-default" onclick="view(2)">修改</button>
                                        </td>
                                    </tr>
                                </table>
                                <button class="btn btn-primary btn-lg" data-toggle="modal" onclick="add()">增加病例</button>
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
    <div class="modal fade" id="welcome_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                    接诊信息
                </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <table class="table">
                            <tr>
                                <td>病例名</td>
                                <td>
                                    <input class='form-control' id="welcome_name" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>接诊文字</td>
                                <td>
                                    <textarea class='form-control' id="welcome_text" /></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>接诊图片</td>
                                <td id="welcome_pic_list">
                                    <div class="row">
                                        <div class="col-xs-4">图片</div>
                                        <div class="col-xs-4">上传时间</div>
                                        <div class="col-xs-4">操作</div>
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
                                        <div class="col-xs-4">视频</div>
                                        <div class="col-xs-4">上传时间</div>
                                        <div class="col-xs-4">操作</div>
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="welcome_submit">
                        提交
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="modal fade" id="check_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                    检查信息
                </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <table class="table">
                            <tr>
                                <td>病例名</td>
                                <td>
                                    <input class='form-control' id="check_name" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>检查文字</td>
                                <td>
                                    <textarea class='form-control' id="check_text" /></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>检查图片</td>
                                <td id="check_pic_list">
                                    <div class="row">
                                        <div class="col-xs-4">图片</div>
                                        <div class="col-xs-4">上传时间</div>
                                        <div class="col-xs-4">操作</div>
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
                                        <div class="col-xs-4">视频</div>
                                        <div class="col-xs-4">上传时间</div>
                                        <div class="col-xs-4">操作</div>
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="check_submit">
                        提交
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="modal fade" id="judge_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                    诊断信息
                </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <table class="table">
                            <tr>
                                <td>病例名</td>
                                <td>
                                    <input class='form-control' id="judge_name" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>检查文字</td>
                                <td>
                                    <textarea class='form-control' id="judge_text" /></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>检查图片</td>
                                <td id="judge_pic_list">
                                    <div class="row">
                                        <div class="col-xs-4">图片</div>
                                        <div class="col-xs-4">上传时间</div>
                                        <div class="col-xs-4">操作</div>
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
                                <td>检查视频</td>
                                <td id="judge_video_list">
                                    <div class="row">
                                        <div class="col-xs-4">视频</div>
                                        <div class="col-xs-4">上传时间</div>
                                        <div class="col-xs-4">操作</div>
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="judge_submit">
                        提交
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="modal fade" id="cure_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                    治疗信息
                </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <table class="table">
                            <tr>
                                <td>病例名</td>
                                <td>
                                    <input class='form-control' id="cure_name" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>检查文字</td>
                                <td>
                                    <textarea class='form-control' id="cure_text" /></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td>检查图片</td>
                                <td id="cure_pic_list">
                                    <div class="row">
                                        <div class="col-xs-4">图片</div>
                                        <div class="col-xs-4">上传时间</div>
                                        <div class="col-xs-4">操作</div>
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
                                <td>检查视频</td>
                                <td id="cure_video_list">
                                    <div class="row">
                                        <div class="col-xs-4">视频</div>
                                        <div class="col-xs-4">上传时间</div>
                                        <div class="col-xs-4">操作</div>
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" id="cure_submit">
                        提交
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="modal fade" id="view_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                    </button>
                    <h4 class="modal-title">
                    修改病例
                </h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <table class="table">
                            <tr>
                                <td>病例名</td>
                                <td>
                                    <input class='form-control' />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="new_case()">
                        提交
                    </button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->
    <div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
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
                                    <input class='form-control' id="" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" onclick="new_case()">
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

    // $.post("./test_for_widgets.php", {},
    //     function(data, status) {
    //         $("#sub-item-basic").empty();
    //         $("#sub-item-basic").append("<li><a href=''><span class='glyphicon glyphicon-share-alt'></span> 科室管理</a></li>");
    //         json1 = eval("(" + data + ")");
    //         for (i = 0; i < json1.length; i++) {
    //             $("#sub-item-basic").append("<li><a href='" + json1[i].id + "'><span class='glyphicon glyphicon-share-alt'></span> " + json1[i].name + "</a></li>");
    //         }
    //     });
    </script>
    <script src="./assets/js/case_manage.js"></script>
    <script src="./assets/js/case_type_manage.js"></script>
</body>

</html>