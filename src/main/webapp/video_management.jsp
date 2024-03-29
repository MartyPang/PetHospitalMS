﻿<%--
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
  	<%@include file="./navbar.jsp"%>
  	<%@include file="./sidebar.jsp"%>
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
  						<button class="btn btn-primary" data-toggle="modal" data-target="#video_upload">添加视频</button>
  						<div class="btn-group">
  							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">批量操作
  								<span class="caret"></span>
  							</button>
  							<ul class="dropdown-menu" role="menu">
  								<li>
  									<a onclick="addLogo()">添加水印</a>
  								</li>
  								<li>
  									<a onclick="processMP4()">格式转换</a>
  								</li>
  								<li>
  									<a onclick="batchDelete()">删除视频</a>
  								</li>
  							</ul>
  						</div>
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
  	<script type="text/javascript" src="./assets/webuploader-0.1.5/webuploader.js"></script>
  	<script src="./assets/pinterest/js/pinterest_grid.js"></script>
  	<script type="text/javascript" src="./assets/custom/js/demo.js"></script>
  	<script src="./assets/js/sidebar.js"></script>
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

  		function addLogo(){
  			var checked = $("input[type='checkbox']:checked");
  			if(checked.length == 0){
  				x0p('提示', '未选择视频！');
  				return;
  			}
  			//id_array = new Array();
  			var v_list = [];
  			checked.each(function(i){
  				video_id = $(this).attr('id').substr(1);
  				var src = $('#v_path' + video_id).text();
  				var item = {
  					video_id : video_id,
  					input_path : src
  				};

  				v_list.push(item);
  			})
  			_list = JSON.stringify(v_list);
  			//先做一个视频
  			// v_id = id_array[0];
  			// var index = $("#"+v_id).attr('id');
  			// var src = $('#v_path' + index).text();
  			$.post("/addLogo.action",
  			{
  				v_list : _list
  			});
  			location.reload();
  		}

  		function processMP4(){
  			var checked = $("input[type='checkbox']:checked");
  			if(checked.length == 0){
  				x0p('提示', '未选择视频！');
  				return;
  			}
  			//id_array = new Array();
  			var v_list = [];
  			checked.each(function(i){
  				video_id = $(this).attr('id').substr(1);
  				var src = $('#v_path' + video_id).text();
  				var item = {
  					video_id : video_id,
  					input_path : src
  				};

  				v_list.push(item);
  			})
  			_list = JSON.stringify(v_list);
  			//先做一个视频
  			// v_id = id_array[0];
  			// var index = $("#"+v_id).attr('id');
  			// var src = $('#v_path' + index).text();
  			$.post("/processMP4.action",
  			{
  				v_list : _list
  			});
  			location.reload();
  		}
  	</script>
  </body>
  </html>
