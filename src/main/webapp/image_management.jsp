<%--
  Created by IntelliJ IDEA.
  User: Marty Pang
  Date: 2017/3/8
  Time: 12:16
  To change this template use File | Settings | File Templates.
  --%>
  <!DOCTYPE html>
  <html>
  <head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<title>图片管理</title>
  	<link href="./assets/gridex/css/bootstrap-responsive.css" rel="stylesheet">
  	<link href="./assets/css/bootstrap.css" rel="stylesheet">
  	<link href="./assets/css/styles.css" rel="stylesheet">
  	<link href="./assets/x0popup/css/x0popup.min.css" rel="stylesheet">
  	<link href="./assets/gridex/css/gridex.css" rel="stylesheet">


  	<script src="./assets/js/jquery-1.11.1.min.js"></script>
  	<script src="./assets/js/bootstrap.min.js"></script>
  	<script src="./assets/x0popup/js/x0popup.min.js"></script>

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
						图片列表
					</div>
					<div class="panel-body">
						<ul class="thumbnails gridex">
							<li class="span3">
								<a href="#" class="thumbnail"> <img alt="230x130" src="./assets/images/pic1.jpg"> </a>
								<!-- gd-expander required -->
								<div class="gd-expander" style="height: 0px">
									<!-- gd-inner optional -->
									<div class="gd-inner">
										<div class="row-fluid">
											<div class="span9">
												<img alt="370x170" class="img-polaroid" src="./assets/images/pic1_b.jpg">
											</div>
											<div class="span2">

												<a href="#" class="btn btn-success">Visit Website</a>
												<br>
												<br>
												<a href="#" class="btn btn-success">Visit Website</a>
												<br>		
											</div>
											<br>
											<div class="span8">
												<p>pic_name</p>
											</div>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	<script src="./assets/gridex/js/bootstrap-gridex.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$('.gridex').gridex();
		});
	</script>
	<script type="text/javascript">
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
