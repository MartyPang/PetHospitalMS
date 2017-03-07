<%@ include file="taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Dashboard</title>

<link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/assets/css/datepicker3.css" rel="stylesheet">
<link href="${ctx}/assets/css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="${ctx}/assets/js/html5shiv.js"></script>
<script src="${ctx}/assets/js/respond.min.js"></script>
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
				<a class="navbar-brand" href="./main.jsp"><span>宠物</span>医院</a>
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
        <li class="parent ">
            <a href="#">
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
                        <span class="glyphicon glyphicon-share-alt"></span> 前端用户管理
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
				<li class="active">主页</li>
			</ol>
		</div><!--/.row-->

		<div class="row">
			<div class="col-lg-12">
			</div>
		</div><!--/.row-->


		<div class="row">
            <h1 align='center'>欢迎登陆宠物医院管理系统</h1>
		</div><!--/.row-->


	</div>	<!--/.main-->

	<script src="${ctx}/assets/js/jquery-1.11.1.min.js"></script>
    <script src="${ctx}/assets/js/bootstrap.min.js"></script>
    <script src="${ctx}/assets/js/chart.min.js"></script>
    <script src="${ctx}/assets/js/chart-data.js"></script>
    <script src="${ctx}/assets/js/easypiechart.js"></script>
    <script src="${ctx}/assets/js/easypiechart-data.js"></script>
    <script src="${ctx}/assets/js/bootstrap-datepicker.js"></script>
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

		$.post("./test_for_widgets.php",
		{
		},
		function(data,status)
		{
		    $("#sub-item-basic").empty();
		    $("#sub-item-basic").append("<li><a href=''><span class='glyphicon glyphicon-share-alt'></span> 科室管理</a></li>");
            json1 = eval("("+data+")");
		    for(i=0;i<json1.length;i++)
		    {
		        $("#sub-item-basic").append("<li><a href='"+json1[i].id+"'><span class='glyphicon glyphicon-share-alt'></span> "+json1[i].name+"</a></li>");
            }
		});
	</script>
</body>

</html>
