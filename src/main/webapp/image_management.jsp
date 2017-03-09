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



    <!--[if lt IE 9]>
    <script src="./assets/js/html5shiv.js"></script>
    <script src="./assets/js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        #gallery-wrapper {
            position: relative;
            max-width: 85%;
            width: 85%;
            margin:50px auto;
        }
        img.thumb {
            width: 100%;
            max-width: 100%;
            height: auto;
        }
        .white-panel {
            position: absolute;
            background: white;
            border-radius: 5px;
            box-shadow: 0px 1px 2px rgba(0,0,0,0.3);
            padding: 10px;
        }
        .white-panel h1 {
            font-size: 1em;
        }
        .white-panel h1 a {
            color: #A92733;
        }
        .white-panel:hover {
            box-shadow: 1px 1px 10px rgba(0,0,0,0.5);
            margin-top: -5px;
            -webkit-transition: all 0.3s ease-in-out;
            -moz-transition: all 0.3s ease-in-out;
            -o-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }

        .modal-body {
          padding:5px !important;
      }
      .modal-content {
          border-radius:0;
      }
      .modal-dialog img {
          text-align:center;
          margin:0 auto;
      }
      .controls{
        width:50px;
        display:block;
        font-size:11px;
        padding-top:8px;
        font-weight:bold;
    }
    .next {
        float:right;
        text-align:right;
    }
    .text {
      color:#666;
      font-size:12px;
      margin-bottom:10px;
      padding:12px;
      background:#fff;
  }
        /*override modal for demo only*/
      .modal-dialog {
          max-width:700px;
      }
      @media screen and (min-width: 768px){
          .modal-dialog {
              margin-top: 150px;
              margin-right: auto;
              margin-bottom: 150px;
              margin-left: auto;
              max-width:700px;
          }
      }

      @media screen and (max-width: 380px){
         .col-xxs-12 {
           width:100%;
         }
         .col-xxs-12 img {
           width:100%;
         }
      }
</style>
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
                        <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#image_upload">添加图片</button>
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
                                        window.location.href = "/image_management.jsp";
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
