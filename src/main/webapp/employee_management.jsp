<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>人员管理</title>

<link href="./assets/css/bootstrap.min.css" rel="stylesheet">
<link href="./assets/css/datepicker3.css" rel="stylesheet">
<link href="./assets/css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="./assets/js/html5shiv.js"></script>
<script src="./assets/js/respond.min.js"></script>
<![endif]-->

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
		</div><!-- /.container-fluid -->
	</nav>

	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
		<li><a href="./user_management.jsp"><span class="glyphicon glyphicon-user"></span> 用户管理</a></li>
        <li class="parent ">
            <a href="#">
                <span class="glyphicon glyphicon-list"></span> 基本结构与功能 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right" id="basic"></span>
            </a>
            <ul class="children " id="sub-item-1">
                <li>
                    <a class="" href="#">
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
            <ul class="children " id="sub-item-1">
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
			<li class=""><a href="#"><span class="glyphicon glyphicon-dashboard"></span> 病例管理</a></li>


			<li role="presentation" class="divider"></li>

		</ul>
	</div><!--/.sidebar-->

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">人员管理</li>
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
            					用户列表
            					</div>
            					<div class="panel-body">
            						<table class="table">
            						    <thead id ="table_content">
            						    <tr>
            						        <th >用户名</th>
            						        <th >用户角色</th>
            						        <th >用户权限</th>
            						        <th >注册时间</th>
            						        <th >科室</th>
            						        <th >修改信息</th>
            						        <th >删除用户</th>
            						    </tr>
            						    </thead>
            						    <tr>
            						        <td id="user_1">二号狗蛋</td>
            						        <td id="role_1" value="1">实习生</td>
            						        <td id="auth_1" value= "3">一般用户</td>
            						        <td>2017-01-02</td>
            						        <td id="room_1" value="3">消化科</td>
            						        <td><button class="btn btn-primary" onclick="modify(1)">修改</button></td>
            						        <td><button class="btn btn-success" onclick="">删除</button></td>
            						    </tr>

            						    <tr>
                                            <td>李狗蛋</td>
                                            <td>实习生</td>
                                            <td>前台</td>
                                            <td>2017-01-02</td>
                                            <td>外科</td>
                                            <td><button class="btn btn-primary" onclick="">修改</button></td>
                                            <td><button class="btn btn-success" onclick="">删除</button></td>
                                        </tr>
            						</table>
            						<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">增加用户</button>
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
                    增加新用户
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                  <table class="table">
                    <tr>
                        <td>用户名</td>
                        <td><input class = 'form-control' id="user_name_new"/></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><input class = 'form-control' id="password_new"/></td>
                    </tr>
                    <tr>
                        <td>用户权限</td>
                        <td>
                            <select class="form-control" id="auth_new">
                               <option value="1">管理员</option>
                               <option value="2">前台</option>
                               <option value="3">一般用户</option> 
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>用户角色</td>
                        <td>
                            <select class="form-control" id="role_new">
                               <option value="1">实习生</option>
                               <option value="2">正式员工</option>
                               <option value="3">大老板</option> 
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>用户科室</td>
                        <td>
                            <select class="form-control" id="room_new">
                               <option value="1">内科</option>
                               <option value="2">外科</option>
                               <option value="3">消化科</option> 
                            </select>
                        </td>
                    </tr>

                  </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" 
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="new()">
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
                <h4 class="modal-title" id="myModalLabel">
                    修改用户
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                  <table class="table">
                    <tr>
                        <td>用户名</td>
                        <td><input class = 'form-control' id="user_name_modi" readonly/></td>
                    </tr>
                    <tr>
                        <td>密码</td>
                        <td><input class = 'form-control' id="password_modi"/></td>
                    </tr>
                    <tr>
                        <td>用户权限</td>
                        <td>
                            <select class="form-control" id="auth_modi">
                               <option value="1">管理员</option>
                               <option value="2">前台</option>
                               <option value="3">一般用户</option> 
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>用户角色</td>
                        <td>
                            <select class="form-control" id="role_modi">
                               <option value="1">实习生</option>
                               <option value="2">正式员工</option>
                               <option value="3">大老板</option> 
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>用户科室</td>
                        <td>
                            <select class="form-control" id="room_modi">
                               <option value="1">内科</option>
                               <option value="2">外科</option>
                               <option value="3">消化科</option> 
                            </select>
                        </td>
                    </tr>

                  </table>
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
	<script src="./assets/js/jquery-1.11.1.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/js/chart.min.js"></script>
    <script src="./assets/js/chart-data.js"></script>
    <script src="./assets/js/easypiechart.js"></script>
    <script src="./assets/js/easypiechart-data.js"></script>
    <script src="./assets/js/bootstrap-datepicker.js"></script>
	<script>
		$('#calendar').datepicker({
		});

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

        function submit()
        {
            $.post("/webapp/test_user_new.php",
            {
                user : $("#user_name_new").val(),
                password : $("#password_new").val(),
                auth : $("#auth_new").val(),
                room : $("#room_new").val(),
                role : $("#role_new").val()
            },
            function(data,status)
            {
                alert(data);
            });
        }

        function modify(id)
        {
            //alert($("#user_"+id).text());return;
            $("#user_name_modi").val($("#user_"+id).text());
            $("#auth_modi").val($("#auth_"+id).attr("value"));
            $("#role_modi").val($("#role_"+id).attr("value"));
            $("#room_modi").val($("#room_"+id).attr("value"));
            $("#modiModal").modal("show");
            $("#modify_button").attr("onclick","change("+id+")");
        }

        function change(id)
        {
            $.post("/webapp/test_user_modify.php",
            {
                auth : $("#auth_modi").val(),
                room : $("#room_modi").val(),
                role : $("#role_modi").val()
            },
            function(data,status)
            {
                alert(data);
            });
        }
	</script>
</body>

</html>
