<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>住院部管理</title>

    <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="./assets/css/datepicker3.css" rel="stylesheet">
    <link href="./assets/css/styles.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="./assets/js/html5shiv.js"></script>
    <script src="./assets/js/respond.min.js"></script>
    <![endif]-->
    <script src="./assets/bootstrap-3.3.7-dist/js/jquery-3.1.1.js"></script>
    <script src="./assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <!--BootStrap-loading-->
    <link rel="stylesheet" href="./assets/bootstrap-loading/dist/ladda-themeless.min.css">
    <script src="./assets/bootstrap-loading/dist/spin.min.js"></script>
    <script src="./assets/bootstrap-loading/dist/ladda.min.js"></script>

    <!--fileinput-->
    <link href="./assets/file-input/css/fileinput.css" rel="stylesheet">
    <script src="./assets/file-input/js/fileinput.js"></script>
    <script src="./assets/file-input/js/locales/zh.js"></script>
    <script>


        //工作内容查看button调用函数
        function content(id) {
            //alert(id);
            switch (id)
            {
                case 1:
                    $("#content_name").val("1.药品调剂人员收到处方后应先查看患者科别、姓名、年龄、临床诊断及核对医师签名，内容不全、表述不清、医师签名不可辩认及其它不规范或不能判定其合法性的处方应退回或与及时医生沟通。\r\n"+
                        "2.药师应当对处方用药适宜性进行审核，主要包括下列内容：: \r\n"+
                        "    1)规定必须做皮试的药品，处方医师是否注明过敏试验及结果的判定；\r\n"+
                        "    2)处方用药与临床诊断的相符性；\r\n"+
                        "    3)剂量、用法的正确性；\r\n"+
                        "    4)选用剂型与给药途径的合理性；\r\n"+
                        "    5)是否有重复给药现象；\r\n"+
                        "    6)是否有潜在临床意义的药物相互作用和配伍禁忌；\r\n"+
                        "3.对于中药饮片处方，审方时着重审查以下项目：\r\n"+
                        "    1)患者姓名、年龄、性别、处方日期、医师签字等是否清楚；\r\n"+
                        "    2)药名、剂量是否清楚准确，剂量是否超出正常量，儿童及年老体弱者特别注意。");
                    break;
                case 2:
                    $("#content_name").val("1.按照生物制品的品种、批号分类整齐存放，生物制品纸箱（盒）之间，与冰箱冰柜壁之间均应留有冷气循环通道。\r\n"+
                        "2.使用时要按照“先短效期，后长效期”和同批生物制品按“先入库、先出库”的原则；\r\n"+
                        "3.定期清点药品种类、数量是否相符，检查药品是否积压变质，如发现有沉淀、变质、变色、过期、标签模糊等药品时，同停止使用，并按有关规定进行处理。\r\n" +
                        "4.对毒麻、限剧药品，贵重药品进 行保管。毒麻药应建立登记卡，保持一定基数，设专用抽屉存放并加锁，每日交接班时清点。" );
                    break;
                case 3:
                    $("#content_name").val("1.要正确合理使用麻醉药品，给患畜开麻醉药品，必须建有病历，每次开药在病历上记录；\r\n"+
                        "2.麻醉药品应有专用处方，专用处方应专印“麻醉药品处方笺”外，还应写明病情摘要和诊断，处方要保存3年；\r\n"+
                        "3.麻醉药品的每张处方注射剂量不得超过2日常用量，片剂、酊剂、糖浆剂等不超过3日常用量，连续使用不得超过7天，麻醉药品禁止非法使用、储存、转让或借用和零售；\r\n"+
                        "4.精神药品应建立收支账目，按季盘点，做到账物相符，第一、二类精神药品原料和一类精神药品的制剂，应实行专人管理，专柜加锁，建立账册，发现问题应按有关规定上报；\r\n"+
                        "5.医疗单位购进的精神药品，只准本单位使用，不得转售；\r\n"+
                        "6.药房应指定专人管理，负责药品领取供应和保管工作；药房药品应定为存放，不得私自放置、截留。");
                    break;
                default:
                    break;
            }
            $("#content_modal").modal("show");
        }


        //职责查看button调用函数
        function welcome(id)
        {
            // alert(id);
            switch (id)
            {
                case 1:
                    $("#duty_name").val("1.处方审核员具有药品监督管理部门认可的处方审核员(中药处方审核员)资格。\r\n"+
                        "2.自觉学习《中华人民共和国药品管理法》、《药品经营质量管理规范》等相关法律、法规，自觉提高自身业务水平及专业知识水平，熟悉药品的性能、用途、配伍禁忌、用法用量等。\r\n"+
                        "3.严格按照公司《处方药销售管理制度》、《中药饮片处方审核调配核对制度》开展处方审核、复核工作。\r\n"+
                        "4.负责对处方进行审核，审核合格后签字或盖章交付调配，对有配伍禁忌或超剂量的处方拒绝调配，但经原处方医师更正或者重新签字确认的，可以调配;对处方所列药品不得擅自更改或代用，处方所写内容模糊不清，难以鉴别有疑问或已被涂改时，不得调配。\r\n"+
                        "5.负责对调配后的处方进行复核工作，对处方所列内容逐个核对无误后签字或盖章。\r\n"+
                        "6.负责处方的保管和归档工作。\r\n"+
                        "7.每年参加继续教育并考核合格，方可继续履行处方审核职责。");
                    break;
                case 2:
                    $("#duty_name").val("1.树立“质量第一”的观念，认真执行《药品管理法》等法律法规，保证在库药品的储存质量，对仓储管理过程中的药品质量负主要责任；\r\n"+
                        "2.储存药品，按质量状态实行色标管理：合格药品为绿色，不合格药品为红色，待确定药品为黄色。\r\n"+
                        "3.按包装标示的温度要求储存药品，包装上没有标示具体温度的，按照《中华人民共和国药典》规定的贮藏要求储存相应库中。\r\n"+
                        "4.做好避光、遮光、通风、防潮、防虫、防鼠等措施。\r\n"+
                        "5.在养护员指导下做好库房温、湿度管理工作，如温湿度不符合规定要求，及时采取措施予以调整；\r\n"+
                        "6.凭验收员签字或盖章的入库凭证收货，对货与单不符、质量异常、包装不牢或破损、标志模糊等情况，予以拒收并报告质量管理部；\r\n"+
                        "7.搬运和堆码药品应当严格按照外包装标示要求规范操作，堆码高度符合包装图示要求，避免损坏药品包装。\r\n"+
                        "8.药品码放垛间距不小于5厘米，与库房内墙、顶、温度调控设备及管道等设施间距不小于30厘米，与地面间距不小于10厘米。\r\n"+
                        "9.药品按批号堆码，不同批号的药品不得混垛。\r\n"+
                        "10.药品与非药品、外用药与其他药品分开存放。\r\n"+
                        "11.特殊管理的药品应当按照国家有关规定储存。\r\n"+
                        "12.拆除外包装的零货药品应当集中存放。\r\n"+
                        "13.储存药品的货架、托盘等设施设备应当保持清洁，无破损和杂物堆放。\r\n"+
                        "14.药品储存作业区内不得存放与储存管理无关的物品。\r\n"+
                        "15.未经批准的人员不得进准入储存作业区");
                    break;
                case 3:
                    $("#duty_name").val("1.由具有扎实专业理论知识、实际操作能力和调剂工作经验的药师以上职称人员担任，遵守和执行本部门的工作规程、规章制度及相关规定。在部门负责人的领导下进行中西药处方及急诊处方的发药工作。\r\n"+
                        "2.收方及审查 收方后详细阅读、认真审查，对处方前记、正文、药品配伍、用法用量、有无涂改现象、医师签字、特殊药品的使用等逐项审核；手工处方的还应核对收费处录入是否正确。对不符合发药规定、缺药或有疑问的处方，应请处方医师再次确认，签字后方可调配，严禁药剂人员擅自更改处方信息。\r\n"+
                        "3.发药时，核对处方和药品的一致性，查处方，对科别、姓名、年龄，查药品，对剂型、规格、数量，查配伍禁忌，对药品性状、用法用量，查用药合理性，对临床诊断。\r\n"+
                        "4.确认调配无误后，发药给病人，向病人交待药品用法用量及注意事项等，态度和蔼、耐心；如遇理解有困难者，请咨询窗口接待解决。发药要求复核率100％，差错小于1/万。\r\n"+
                        "5.参加药学继续教育，不断提高业务水平；做好实习生、进修生的带教工作。");
                    break;
                default:
                    break;
            }
            $("#duty_modal").modal("show");

        }



        //流程图片查看button调用函数
        function check(id)
        {
            switch(id) {
                case 1:
                    $("#pic_modal_img").attr('src', 'pictures/shenhe.png');
                    break;

                case 2:
                    $("#pic_modal_img").attr('src', 'pictures/cunfang.png');
                    break;

                case 3:
                    $("#pic_modal_img").attr('src', 'pictures/fafang.png');
                    break;

                default:
                    break;
            }

            $("#pic_modal" ).modal("show");
        }



        function judge(id)
        {

//            switch(id) {
//                case 1:
//                    $("#flow_video").attr('src', 'video/01.mpeg');
//                    break;
//
//                case 2:
//                    $("#flow_video").attr('src', 'video/01.mpeg');
//                    break;
//
//                case 3:
//                    $("#flow_video").attr('src', 'video/01.mpeg');
//                    break;
//
//                default:
//                    break;
//            }

            $("#video_modal" ).modal("show");

        }


        //        function cure(id)
        //        {
        //
        //            $("#cure_modal").modal("show");
        //        }



        //            function uploadImage() {
        //                $("#input_image").fileinput('refresh');
        //            }


        //        !function ($) {
        //        $(document).on("click","#basic", function(){
        //            $('#basic_em').toggleClass("glyphicon-minus");
        //        });
        //        $('#basic_em').addClass("glyphicon-plus");
        //        }(window.jQuery);
        //
        //
        //
        //
        //        !function ($) {
        //            $(document).on("click","#role", function(){
        //                $('#role_em').toggleClass("glyphicon-minus");
        //            });
        //            $('#role_em').addClass("glyphicon-plus");
        //        }(window.jQuery);
        //
        //        $(window).on('resize', function () {
        //            if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
        //        })
        //        $(window).on('resize', function () {
        //            if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
        //        })
        //            {
        //                $.post("/webapp/test_user_new.php",
        //                    {
        //                        user : $("#user_name_new").val(),
        //                        password : $("#password_new").val(),
        //                        auth : $("#auth_new").val()
        //                    },
        //                    function(data,status)
        //                    {
        //                        alert(data);
        //                    });
        //            }




        <!--$("#welcome_pic_list").empty();-->
        <!--$.post("./test_pic_return.php",-->
        <!--{-->
        <!--welcome_id : id-->
        <!--},-->
        <!--function(data,status)-->
        <!--{-->
        <!--json1 = eval("("+data+")");-->

        <!--});-->
        <!--$("#welcome_modal").modal("show");-->
        <!--}-->



        <!--function judge(id)-->
        <!--{-->
        <!--$("#judge_modal").modal("show");-->
        <!--}-->

        <!--function cure(id)-->
        <!--{-->
        <!--$("#cure_modal").modal("show");-->
        <!--}-->

        <!--function view(id)-->
        <!--{-->
        <!--$("#view_modal").modal("show");-->
        <!--}-->

    </script>
    <!--jquery-confirm-->
    <!--想·-->
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
        <li class=""><a href="/example_management.jsp"><span class="glyphicon glyphicon-dashboard"></span> 病例管理</a></li>


        <li role="presentation" class="divider"></li>

    </ul>
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
    <div class="row">
        <ol class="breadcrumb">
            <li><a href="#"><span class="glyphicon glyphicon-home"></span></a></li>
            <li class="active">住院部管理</li>
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
                    工作流程列表
                </div>
                <div class="panel-body">
                    <table class="table">
                        <thead id ="table_content">
                        <tr>
                            <th >工作名称</th>
                            <th >工作内容</th>
                            <th >岗位责任</th>
                            <th >工作流程图片</th>
                            <th >工作流程视频</th>
                            <th >修改时间</th>
                            <th >状态</th>
                            <th >修改</th>
                        </tr>
                        </thead>
                        <tr>
                            <td id="case_type_1">病例护理升级</td>
                            <td><button class="btn btn-success" onclick="content(1)">查看</button></td>
                            <td><button class="btn btn-primary" onclick="welcome(1)">查看</button></td>
                            <td><button class="btn btn-danger" onclick="check(1)">查看</button></td>
                            <td><button class="btn btn-warning" onclick="judge(1)">查看</button></td>
                            <td><button class="btn btn-success" onclick="cure(1)">查看</button></td>
                            <td>失效</td>
                            <td><button class="btn btn-default" onclick="view(1)">修改</button></td>
                        </tr>

                        <tr>
                            <td id="case_type_2">消毒流程</td>
                            <td><button class="btn btn-success" onclick="content(2)">查看</button></td>
                            <td><button class="btn btn-primary" onclick="welcome(2)">查看</button></td>
                            <td><button class="btn btn-danger" onclick="check(2)">查看</button></td>
                            <td><button class="btn btn-warning" onclick="judge(2)">查看</button></td>
                            <td><button class="btn btn-success" onclick="cure(2)">查看</button></td>
                            <td>有效</td>
                            <td><button class="btn btn-default" onclick="view(2)">修改</button></td>
                        </tr>

                        <tr>
                            <td id="case_type_3">住院部工作流程</td>
                            <td><button class="btn btn-success" onclick="content(3)">查看</button></td>
                            <td><button class="btn btn-primary" onclick="welcome(3)">查看</button></td>
                            <td><button class="btn btn-danger" onclick="check(3)">查看</button></td>
                            <td><button class="btn btn-warning" onclick="judge(3)">查看</button></td>
                            <td><button class="btn btn-success" onclick="cure(3)">查看</button></td>
                            <td>有效</td>
                            <td><button class="btn btn-default" onclick="view(3)">修改</button></td>
                        </tr>
                    </table>
                    <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">增加工作流程</button>
                </div>
            </div>


        </div>
    </div><!--/.row-->


</div>	<!--/.main-->



<div class="modal fade" id="content_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    主要内容
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                    <table class="table">
                        <tr>
                            <textarea class = 'form-control' name="textarea1"  rows="10" id="content_name" readonly/></textarea></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade" id="duty_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title">
                    责任
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                    <table class="table">
                        <tr>
                            <td><textarea class = 'form-control' name="textarea2"  rows="10" id="duty_name" readonly/></textarea></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="modal-footer">

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade" id="pic_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="">
                    工作流程
                </h4>
            </div>
            <div class="modal-body">

                <img id="pic_modal_img" src=""
                     style="width:500px; height: 600px" />


            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade" id="video_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>

            </div>
            <div class="modal-body">
                <video id="flow_video" width="568" height="444" src="http://www.w3school.com.cn/i/movie.ogg"  autoplay="autoplay" preload="none">123</video>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<div class="modal fade" id="cure_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="">
                    治疗信息
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                    <table class="table">
                        <tr>
                            <td>病例名</td>
                            <td><input class = 'form-control' id=""/></td>
                        </tr>
                    </table>
                </div>
            </div>


            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="new_case()">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div class="modal fade" id="view_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="">
                    修改病例
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                    <table class="table">
                        <tr>
                            <td>病例名</td>
                            <td><input class = 'form-control' id=""/></td>
                        </tr>



                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="new_case()">
                    提交
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"
                        aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    增加工作流程
                </h4>
            </div>
            <div class="modal-body">
                <div class = "row">
                    <table class="table">
                        <tr>
                            <td>工作名称</td>
                            <td><input class = 'form-control' id="case_name_new"/></td>
                        </tr>



                    </table>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default"
                        data-dismiss="modal">关闭
                </button>
                <button type="button" class="btn btn-primary" onclick="new_case()">
                    提交
                </button>
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


</body>

</html>
