<%--
  Created by IntelliJ IDEA.
  User: Marty Pang
  Date: 2017/3/11
  Time: 13:54
  To change this template use File | Settings | File Templates.
  --%>
  <!DOCTYPE html>
  <html>
  <head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<title>视频管理</title>
  	<link href="./assets/pinterest/css/normalize.css" rel="stylesheet">
  	<link href="./assets/css/bootstrap.min.css" rel="stylesheet">

  	<link href="./assets/css/styles.css" rel="stylesheet">
  	<link href="./assets/x0popup/css/x0popup.min.css" rel="stylesheet">
  	<link rel="stylesheet" type="text/css" href="./assets/custom/css/syntax.css">
  	<link rel="stylesheet" type="text/css" href="./assets/custom/css/style.css">
  	<link rel="stylesheet" type="text/css" href="./assets/webuploader-0.1.5/webuploader.css">
  	<link rel="stylesheet" type="text/css" href="./assets/custom/css/demo.css">

  	<script src="./assets/js/jquery-1.11.1.min.js"></script>
  	<script src="./assets/js/bootstrap.min.js"></script>
  	<script src="./assets/x0popup/js/x0popup.min.js"></script>
  	<script src="./assets/dplayer/DPlayer.min.js"></script>

  	<!-- checkbox -->
  	<link href="./assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  	<link href="./assets/pinterest/css/awesome-bootstrap-checkbox.css" rel="stylesheet">

  	<link href="./assets/pinterest/css/pinterest.css" rel="stylesheet">
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
  				<li class="active">视频管理</li>
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
  						<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#video_upload">添加视频</button>
  						<button class="btn btn-danger btn-lg" onclick="batchDelete()">批量删除</button>
  					</div>
  					<div class="panel-body"> 
  						<section id="gallery-wrapper">
  						</section>   
  					</div>
  				</div>
  			</div>
  		</div><!--/.row-->
  	</div>	<!--/.main-->

  	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  		<div class="modal-dialog">
  			<div class="modal-content">
  				<div class="modal-body">
  					<div class="dplayer" id="video_player"></div>
  				</div>
  			</div><!-- /.modal-content -->
  		</div><!-- /.modal-dialog -->
  	</div><!-- /.modal -->

  	<div class="modal fade" id="video_upload" tabindex="-1" role="dialog" aria-hidden="true">
  		<div class="modal-dialog modal-lg">
  			<div class="modal-content">
  				<div class="modal-header">
  					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
  					<h4 class="modal-title">Upload</h4>
  				</div>
  				<div class="modal-body">
  					<div id="uploader" class="wu-example">
  						<div class="queueList">
  							<div id="dndArea" class="placeholder">
  								<div id="filePicker"></div>
  								<p>或将视频拖到这里</p>
  							</div>
  						</div>
  						<div class="statusBar" style="display:none;">
  							<div class="progress">
  								<span class="text">0%</span>
  								<span class="percentage"></span>
  							</div><div class="info"></div>
  							<div class="btns">
  								<div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
  							</div>
  						</div>
  					</div>
  				</div>
  				<div class="modal-footer">
  					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="closeUploader()">Close</button>
  				</div>
  			</div>
  		</div>
  	</div>
  	<script type="text/javascript" src="${ctx}/assets/webuploader-0.1.5/webuploader.js"></script>
  	<script src="./assets/pinterest/js/pinterest_grid.js"></script>
  	<script type="text/javascript" src="${ctx}/assets/custom/js/demo.js"></script>
  	<script type="text/javascript">
  		$(function(){
  			$("#gallery-wrapper").pinterest_grid({
  				no_columns: 4,
  				padding_x: 10,
  				padding_y: 10,
  				margin_bottom: 50,
  				single_column_breakpoint: 700
  			});

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

  		function batchDelete() {
  			var flag=0;
  			var checked = $("input[type='checkbox']:checked");
  			if(checked.length == 0){
  				x0p('提示', '未选择视频！');
  				return;
  			}
  			var filter="";
  			checked.each(function(i){
  				video_id = $(this).attr('id').substr(1);
  				filter = filter + "," + video_id;
  			})
  			x0p('Confirmation', 'Are you sure?', 'warning',
  				function (button) {
  					if(button == 'cancel'){
  					}else{
  						$.post("/deleteVideo.action",
  						{
  							filter:filter
  						},
  						function(data,status){
  							if(data=='true'){
  								window.location.href = "/video_management.jsp";
  							}
  						});
  					}
  				});
  		}
  	</script>
  </body>
  </html>
