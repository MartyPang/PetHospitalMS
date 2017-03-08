<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>用户管理</title>

<link href="./assets/css/bootstrap.min.css" rel="stylesheet">
<link href="./assets/css/datepicker3.css" rel="stylesheet">
<link href="./assets/css/styles.css" rel="stylesheet">
    <link href="./assets/x0popup/css/x0popup.min.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="./assets/js/html5shiv.js"></script>
<script src="./assets/js/respond.min.js"></script>
<![endif]-->
    <script src="./assets/js/jquery-1.11.1.min.js"></script>
    <script src="./assets/x0popup/js/x0popup.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/js/chart.min.js"></script>
    <script src="./assets/js/chart-data.js"></script>
    <script src="./assets/js/easypiechart.js"></script>
    <script src="./assets/js/easypiechart-data.js"></script>
    <script src="./assets/js/bootstrap-datepicker.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $.post("/getUserList.action",
                {},
        function(data,status){
            var result = data.Result;
            if(result=='OK'){
                var jsonArray = data.Records;
                for(var i=0;i<jsonArray.length;++i){
                    var oneline = jsonArray[i];
                    $("#user_table").append("<tr><td id='user_"+oneline.id+"'>"+oneline.name+
                            "</td><td>"+
                            oneline.create_time+
                            "</td><td><button class='btn btn-primary' onclick='modify("+oneline.id+ ")'>修改</button></td> <td><button class='btn btn-success' onclick='deleteUser("+oneline.id+")'>删除</button></td> </tr>");
                }
            }
            //alert(data.Records);
        });
            });
</script>
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
		<a href="#">
                <li class="parent">
                                <span class="glyphicon glyphicon-list"></span> 用户管理 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right" id='role'></span>
                            </a>
                            <ul class="children ">
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
                <span class="glyphicon glyphicon-list"></span> 职能学习 <span data-toggle="collapse" href="#sub-item-1" class="icon pull-right"></span>
            </a>
            <ul class="children ">
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
				<li class="active">用户管理</li>
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
            						<table class="table" id="user_table">
            						    <thead id ="table_content">
            						    <tr>
            						        <th >用户名</th>
            						        <th >注册时间</th>
            						        <th >修改信息</th>
            						        <th >删除用户</th>
            						    </tr>
            						    </thead>
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
                <h4 class="modal-title">
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
                  </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" 
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="addUser()">
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

        function addUser()
        {
            var username = $("#user_name_new").val();
            var password = $("#password_new").val();
            var authority = $("#auth_new").val();
            if(username.length==0){
                x0p('提示', '请输入用户名');
                return;
            }
            if(password.length<6){
                x0p('提示', '密码至少6位');
                return;
            }
            $.post("/addUser.action",
            {
                username : username,
                password : password,
            },
            function(data,status){
                if(data=='true'){
                    window.location.href = "/user_management.jsp";
                }
            });
        }

        function modify(id)
        {
            $("#user_name_modi").val($("#user_"+id).text());
            $("#modiModal").modal("show");
            $("#modify_button").attr("onclick","change("+id+")");
        }

        function change(id)
        {
            var flag = 0;
            if($("#password_modi").val() == "" || $("#password_modi").val() == null)
            {
                flag = 1;
            }
            if($("#password_modi").val().length>0&&$("#password_modi").val().length<6){
                x0p('提示', '密码至少6位');
                return;
            }
            $.post("/updateUser.action",
            {
                password : $("#password_modi").val(),
                flag : flag,
                id : id
            },
            function(data,status)
            {
                if(data=='true'){
                    window.location.href = "/user_management.jsp";
                }
            });
        }

        function deleteUser(id){
            x0p('Confirmation', 'Are you sure?', 'warning',
                 function (button) {
                     if(button == 'cancel'){
                     }else{
                         $.post("/deleteUser.action",
                                 {
                                     id : id
                                 },
                                 function(data,status)
                                 {
                                     if(data=='true'){
                                         location.reload();
                                     }
                                 });
                     }
                 });
        }
	</script>
</body>

</html>
