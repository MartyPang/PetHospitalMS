<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Dashboard</title>

<link href="${ctx}/assets/css/bootstrap.min.css" rel="stylesheet">
<link href="${ctx}/assets/css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="${ctx}/assets/js/html5shiv.js"></script>
<script src="${ctx}/assets/js/respond.min.js"></script>
<![endif]-->

</head>

<body>
    <%@include file="./navbar.jsp"%>
    <%@include file="./sidebar.jsp"%>

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

	<script src="./assets/js/jquery-1.11.1.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/js/sidebar.js"></script>
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
