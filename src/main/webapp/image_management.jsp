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
  	<link href="./assets/pinterest/css/normalize.css" rel="stylesheet">
  	<link href="./assets/css/bootstrap.min.css" rel="stylesheet">

  	<link href="./assets/css/styles.css" rel="stylesheet">
  	<link href="./assets/x0popup/css/x0popup.min.css" rel="stylesheet">

  	<script src="./assets/js/jquery-1.11.1.min.js"></script>
  	<script src="./assets/js/bootstrap.min.js"></script>
  	<script src="./assets/x0popup/js/x0popup.min.js"></script>

  	<!--fileinput-->
  	<link href="./assets/file-input/css/fileinput.css" rel="stylesheet">
  	<script src="./assets/file-input/js/fileinput.js"></script>
  	<script src="./assets/file-input/js/locales/zh.js"></script>

  	<!-- checkbox -->
  	<link href="./assets/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  	<link href="./assets/pinterest/css/awesome-bootstrap-checkbox.css" rel="stylesheet">

  	<link href="./assets/pinterest/css/pinterest.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="./assets/js/html5shiv.js"></script>
    <script src="./assets/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	<%@include file="./navbar.jsp"%>
	<%@include file="./sidebar.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">图片管理</li>
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
						<button class="btn btn-primary" data-toggle="modal" data-target="#image_upload">添加图片</button>
						<div class="btn-group">
							<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">批量操作
								<span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li>
									<a onclick="transferFormat()">格式转换</a>
								</li>
								<li>
									<a onclick="batchDelete()">删除视频</a>
								</li>
							</ul>
						</div>
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
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<!--图片上传的modal-->
<div class="modal fade modal_upload" id="image_upload" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title">Upload</h4>
			</div>
			<div class="modal-body">
				<input id="input_image" name="uploadFile" type="file" multiple>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<script src="./assets/pinterest/js/pinterest_grid.js"></script>
<script src="./assets/pinterest/js/photo-gallery.js"></script>
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
			x0p('提示', '未选择图片！');
			return;
		}
		var filter="";
		checked.each(function(i){
			image_id = $(this).attr('id').substr(1);
			filter = filter + "," + image_id;
		})
		x0p('Confirmation', 'Are you sure?', 'warning',
			function (button) {
				if(button == 'cancel'){
				}else{
					$.post("/deleteImage.action",
					{
						filter:filter
					},
					function(data,status){
						if(data=='true'){
							location.reload();
						}
					});
				}
			});
	}

	function transferFormat(){
		var checked = $("input[type='checkbox']:checked");
		if(checked.length == 0){
			x0p('提示', '未选择视频！');
			return;
		}
  		//id_array = new Array();
  		var p_list = [];
  		checked.each(function(i){
  			var image_id = $(this).attr("id").substr(1);
  			var index = $(this).parent('div').parent('div').parent('article').attr('data-index');
  			var src = $('#img_o'+index).text();
  			var item = {
  				image_id : image_id,
  				input_path : src
  			};
  			p_list.push(item);
  		})
  		_list = JSON.stringify(p_list);
  		x0p({
  			title: '转换格式',
  			type: 'warning',
  			inputType: 'text',
  			inputPlaceholder: '支持jpg,bmp,png,gif...',
  			inputColor: '#F29F3F',
  			inputValidator: function(button, value) {
  				if(value == '' || value != 'jpg' && value != 'bmp' && value != 'png' && value != 'gif')
  					return 'Not a valid image type!';
  				return null;
  			}
  		}, function(button, text) {
  			if(button == 'warning') {
  				// x0p('提示', 
  				// 	'正在转换格式！', 
  				// 	'ok', true);  
  				$.post("/transferFormat.action",{
  					p_list : _list,
  					dest_type : text
  				},
  				function(data,status){
  					if(data == 'true'){
  						location.reload();
  					}
  				});
  			}
  		});
  		
  	}

  	$("#input_image").fileinput({
  		language: 'en',
  		uploadUrl: "/upload?type=image",
  		showCaption: true,
  		browseClass: "btn btn-info",
  		allowedPreviewTypes: ['image'],
  		allowedFileExtensions: ['bmp','jpg','jpeg','gif','png']
  	});
  </script>
</body>
</html>
