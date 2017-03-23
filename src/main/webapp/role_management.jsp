<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>角色管理</title>

	<link href="./assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="./assets/css/styles.css" rel="stylesheet">
	<link href="./assets/x0popup/css/x0popup.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="./assets/js/html5shiv.js"></script>
    <script src="./assets/js/respond.min.js"></script>
    <![endif]-->
    <script src="./assets/js/jquery-1.11.1.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <script src="./assets/x0popup/js/x0popup.min.js"></script>

    <script type="text/javascript">
    	$(document).ready(function() {
    		$.post("/getRoleList.action",
    			{},
    			function(data,status){
    				var result = data.Result;
    				if(result=='OK'){
    					var jsonArray = data.Records;
    					for(var i=0;i<jsonArray.length;++i){
    						var oneline = jsonArray[i];
    						role_id=  oneline.role_id;
    						role_name = oneline.role_name;
    						role_des = oneline.role_des;
    						if(role_des.length>15){
    							role_des = role_des.substr(0,15);
    						}
    						$("#role_table").append("<tr><td id='role_id"+role_id+"'>"+role_id+"<td id='role_name"+role_id+"'>"+role_name+
    							"</td><td>"+role_des+
    							"</td><td><button class='btn btn-primary' onclick='showModifyModal("+role_id+ ")'>修改</button></td> <td><button class='btn btn-success' onclick='deleteRole("+role_id+")'>删除</button></td> </tr>");
    					}
    				}
                        //alert(data.Records);
                    });
    	});
    </script>
</head>

<body>
	<%@include file="./navbar.jsp"%>
	<%@include file="./sidebar.jsp"%>

	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">角色管理</li>
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
						角色列表
					</div>
					<div class="panel-body">
						<table class="table" id="role_table">
							<thead id ="table_content">
								<tr>
									<th >角色ID</th>
									<th >角色名</th>
									<th>角色描述</th>
									<th >修改信息</th>
									<th >删除角色</th>
								</tr>
							</thead>
						</table>
						<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">增加角色</button>
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
					增加角色
				</h4>
			</div>
			<div class="modal-body">
				<div class = "row">
					<table class="table">
						<tr>
							<td>角色名</td>
							<td><input class = 'form-control' id="role_name_new"/></td>
						</tr>
						<tr>
							<td>角色描述</td>
							<td>
								<textarea class='form-control' id="role_des_new" /></textarea>
							</td>
						</tr>

					</table>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default"
				data-dismiss="modal">关闭
			</button>
			<button type="button" class="btn btn-primary" onclick="addRole()">
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
				修改角色
			</h4>
		</div>
		<div class="modal-body">
			<div class = "row">
				<table class="table">
					<tr>
						<td>角色名</td>
						<td><input class = 'form-control' id="role_name_modi"/></td>
					</tr>
					<tr>
						<td>角色描述</td>
						<td>
							<textarea class='form-control' id="role_des_modi" /></textarea>
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


	function addRole(){
		role_name_new = $("#role_name_new").val();
		if(role_name_new.length == 0){
			x0p("提示","请输入角色名");
			return;
		}
		role_des_new = $("#role_des_new").val();
		if(role_des_new.length == 0){
			x0p("提示","请输入角色描述");
			return;
		}
		$.post("/addRole.action",
		{
			role_name : role_name_new,
			role_des : role_des_new,

		},
		function(data,status)
		{
			if(data == 'true'){
				location.reload();
			}
		});
	}

	function showModifyModal(id){
		$.post("/getRoleInfo.action",
		{
			role_id : id
		},
		function(data,status){
			$("#role_name_modi").val(data.role_name);
			$("#role_des_modi").val(data.role_des);

			$("#modiModal").modal('show');
			$("#modify_button").attr("onclick","modifyRole("+id+")");
		});
	}

	function modifyRole(id){
		role_name_modi= $("#role_name_modi").val();
		if(role_name_modi.length == 0){
			x0p("提示","请输入角色名");
			return;
		}
		role_des_modi = $("#role_des_modi").val();
		if(role_des_modi.length == 0){
			x0p("提示","请输入角色描述");
			return;
		}
		$.post("/updateRole.action",
		{
			role_id : id,
			role_name : role_name_modi,
			role_des : role_des_modi,
		},
		function(data,status)
		{
			if(data == 'true'){
				location.reload();
			}
		});
	}

	function deleteRole(id){
		x0p('Confirmation', 'Are you sure?', 'warning',
			function (button) {
				if(button == 'cancel'){
				}else{
					$.post("/deleteRole.action",
					{
						role_id : id
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
