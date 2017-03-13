<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>科室管理</title>

	<link href="./assets/css/bootstrap.min.css" rel="stylesheet">
	<link href="./assets/css/styles.css" rel="stylesheet">

<!--[if lt IE 9]>
<script src="./assets/js/html5shiv.js"></script>
<script src="./assets/js/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
	$(document).ready(function() {
		$.post("/getDepartmentList.action",
			{},
			function(data,status){
				var result = data.Result;
				if(result=='OK'){
					var jsonArray = data.Records;
					for(var i=0;i<jsonArray.length;++i){
						var oneline = jsonArray[i];
						dpm_id=  oneline.dpm_id;
						dpm_name = oneline.dpm_name;
						dpm_des = oneline.dpm_des;
						if(dpm_des.length>15){
							dpm_des = dpm_des.substr(0,15);
						}
						dpm_func = oneline.dpm_func;
						if(dpm_func.length>15){
							dpm_func = dpm_func.substr(0,15);
						}
						role_id = oneline.role_id;
						role_name = oneline.role_name;
						$("#user_table").append("<tr><td id='dpm_id"+dpm_id+"'>"+dpm_id+"<td id='dpm_name"+dpm_id+"'>"+dpm_name+
							"</td><td>"+dpm_des+"</td><td>"+dpm_func+"</td><td>"+role_name+
							"</td><td><button class='btn btn-primary' onclick='showModifyModal("+dpm_id+ ")'>修改</button></td> <td><button class='btn btn-success' onclick='deleteDpm("+dpm_id+")'>删除</button></td> </tr>");
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
				<ul class="children " id="sub-item-1">
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
				<li class="active">科室管理</li>
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
									<th >科室ID</th>
									<th >科室名</th>
									<th>科室描述</th>
									<th>科室职责</th>
									<th>角色</th>
									<th >修改信息</th>
									<th >删除科室</th>
								</tr>
							</thead>
						</table>
						<button class="btn btn-primary btn-lg" data-toggle="modal" onclick="showAddModal()">增加科室</button>
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
					增加新科室
				</h4>
			</div>
			<div class="modal-body">
				<div class = "row">
					<table class="table">
						<tr>
							<td>科室名</td>
							<td><input class = 'form-control' id="dpm_name_new"/></td>
						</tr>
						<tr>
							<td>科室描述</td>
							<td>
								<textarea class='form-control' id="dpm_des_new" /></textarea>
							</td>
						</tr>
						<tr>
							<td>科室职责</td>
							<td>
								<textarea class='form-control' id="dpm_func_new" /></textarea>
							</td>
						</tr>
						<tr>
							<td>角色</td>
							<td>
								<select class="form-control" id="role_select">
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
			<button type="button" class="btn btn-primary" onclick="addDpm()">
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
					修改科室
				</h4>
			</div>
			<div class="modal-body">
				<div class = "row">
					<table class="table">
						<tr>
							<td>科室名</td>
							<td><input class = 'form-control' id="dpm_name_modi"/></td>
						</tr>
						<tr>
							<td>科室描述</td>
							<td>
								<textarea class='form-control' id="dpm_des_modi" /></textarea>
							</td>
						</tr>
						<tr>
							<td>科室职责</td>
							<td>
								<textarea class='form-control' id="dpm_func_modi" /></textarea>
							</td>
						</tr>
						<tr>
							<td>角色</td>
							<td>
								<select class="form-control" id="role_select_modi">
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

	function showAddModal(){
		$.post("/getRoleList.action",
			{},
			function(data,status){
				var result = data.Result;
				if(result=='OK'){
					var jsonArray = data.Records;
					for(var i=0;i<jsonArray.length;++i){
						role_id = jsonArray[i].role_id;
						role_name = jsonArray[i].role_name;
						if(i==0){
							$('#role_select').append("<option value='"+role_id+"' selected='selected'>"+role_name+"</option>");
						}else{
							$('#role_select').append("<option value='"+role_id+"'>"+role_name+"</option>");
						}
					}
					$('#myModal').modal('show');
				}
			});
	}

	function addDpm(){
		dpm_name_new = $("#dpm_name_new").val();
		if(dpm_name_new.length == 0){
			x0p("提示","请输入科室名");
			return;
		}
		dpm_des_new = $("#dpm_des_new").text();
		if(dpm_des_new.length == 0){
			x0p("提示","请输入科室描述");
			return;
		}
		dpm_func_new = $("#dpm_func_new").text();
		if(dpm_func_new.length == 0){
			x0p("提示","请输入科室职责");
			return;
		}
		role_id = $("#role_select").val();
		role_name = $("#role_select").find("option:selected").text();
		$.post("/addDepartment.action",
		{
			dpm_name : dpm_name_new,
			dpm_des : dpm_des_new,
			dpm_func : dpm_func_new,
			role_id : role_id,
			role_name : role_name

		},
		function(data,status)
		{
			if(data == 'true'){
				location.reload();
			}
		});
	}

	function showModifyModal(id){	
		$.post("/getRoleList.action",
			{},
			function(data,status){
				var result = data.Result;
				if(result=='OK'){
					var jsonArray = data.Records;
					for(var i=0;i<jsonArray.length;++i){
						role_id = jsonArray[i].role_id;
						role_name = jsonArray[i].role_name;
					    $('#role_select_modi').append("<option value='"+role_id+"'>"+role_name+"</option>");
					}
					$('#myModal').modal('show');
				}
			});
		$.post("/getDepartmentInfo.action",
			{
				dpm_id : id
			},
			function(data,status){
				$("#dpm_name_modi").val(data.dpm_name);
				$("#dpm_des_modi").val(data.dpm_des);
				$("#dpm_func_modi").val(data.dpm_func);
				$("role_select_modi").val(data.role_id);

				$("#modiModal").modal('show');
				    $("#modify_button").attr("onclick","modifyDpm("+id+")");
			});
	}

	function modifyDpm(id){
				dpm_name_modi= $("#dpm_name_modi").val();
		if(dpm_name_modi.length == 0){
			x0p("提示","请输入科室名");
			return;
		}
		dpm_des_modi = $("#dpm_des_modi").text();
		if(dpm_des_modi.length == 0){
			x0p("提示","请输入科室描述");
			return;
		}
		dpm_func_modi = $("#dpm_func_modi").text();
		if(dpm_func_modi.length == 0){
			x0p("提示","请输入科室职责");
			return;
		}
		role_id = $("#role_select_modi").val();
		role_name = $("#role_select_modi").find("option:selected").text();
		$.post("/updateDepartment.action",
		{
			dpm_id : id,
			dpm_name : dpm_name_modi,
			dpm_des : dpm_des_modi,
			dpm_func : dpm_func_modi,
			role_id : role_id,
			role_name : role_name

		},
		function(data,status)
		{
			if(data == 'true'){
				location.reload();
			}
		});
	}

function deleteDpm(id){
    x0p('Confirmation', 'Are you sure?', 'warning',
       function (button) {
           if(button == 'cancel'){
           }else{
               $.post("/deleteDpm.action",
               {
                   dpm_id : id
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
