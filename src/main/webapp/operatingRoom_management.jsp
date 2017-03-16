<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>手术室管理</title>

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
            // alert(id);
            switch (id)
            {
                case 1:
                    $("#content_name").val("手术室空间存在飞沫和尘埃，可常有致病菌。为了预防手术创面受沾染，必须尽可能净化手术室空间。为此一般所采取的措施是尽量限制进入手术的人员数；手术室的工作人员必须按规定更换着装和戴口罩；病人的衣物不得带入手术室；用湿法清除室内墙地和物品的尘埃等。\r\n"+
                        "目前常用的空间消毒法有紫外线照射和化学气体熏蒸两种方法。\r\n"+
                        "（1）紫外线消毒法：多用悬吊紫外线灯管（电压220V，波长253.7mm，功率30W），距离1米处，强度＞70uw/c㎡，每立方米空间用量＞115W，照射时间大于30分钟。室温宜在20～35C，湿度小于60%.使用过程中、紫外线强度逐渐降低，一般有效期为1000小时，因此，需有消毒效果监测记录。\r\n"+
                        "（2）化学气体熏蒸法：\r\n"+
                        "①乳酸熏蒸法用80%乳酸12ml/m3加12ml，加热后所产生的气体杀灭空气中细菌。从加热后手术间要封闭4～6小时医`学教育网搜集整理。\r\n"+
                        "②福尔马林（甲醛）熏蒸法用40%甲醛4ml/m3加水2ml/m3与高锰酸钾2g/m3混合，通过化学反应产生气体能杀灭空气中细菌。手术间封闭12～24小时。\r\n"+
                        "为了消除空间的尘粒和减少其中细菌数，现在可以用过滤通气的层流法。手术间建筑成完全或半完全封闭的空间，外界空气经过滤装置通向手术间或手术台周围。滤过的空气所含微粒（包括微生物）可少至每升35个以下。空间换气为间歇性，每小时20～25次，故称“层流”。采用这种净化方法的手术间可称“超净手术间”。由于建设费用较高昂，超净手术间目前尚未普及，目前设置于现代化医院内。");
                    break;
                case 2:
                    $("#content_name").val("通常采取的方法时,摘除公宠物的睾丸进行结扎,而对母宠物采取子宫、卵巢摘除手术。\r\n"+
                        "动手术时先对狗进行全身麻醉,因此不会有太大的痛苦。\r\n"+
                        "公宠物、母宠物最适宜的手术期是在未成年时,具体事宜请与兽医商量后决定。" );
                    break;
                case 3:
                    $("#content_name").val("1.一般手术器械的处理:\r\n"+
                        "一般手术器械是指非感染的手术器械，如甲状腺、疝气、椎间盘等手术器械。\r\n"+
                        "处理方法：将术后器械的流动水下去除血污→酶浸泡2min以上（或+超声波震荡）→流动水彻底冲洗→分类烘干（精细、尖锐的器械要分开）→检查→上油→包装或分类存放于器械柜内。\r\n"+
                        "2.一般感染手术器械的处理:\r\n"+
                        "一般感染手术器械是指切开腔道（如胃、肠、胰、阑尾等）、肿瘤根治、胧肿切开、结核病灶清除以及为感染梅毒、艾滋病、病毒性肝炎患者实施手术的器械。\r\n"+
                        "处理方法：将术后器械浸泡于含氯消毒液中30min→流动水刷洗干净→分类烘干→检查→上油→分类保存于器械柜中。\r\n"+
                        "3.特殊感染手术器械的处理:\r\n"+
                        "特殊感染手术器械是指气性坏疽、炭疽、破伤风手术器械。\r\n"+
                        "处理方法：将术后器械浸泡于含氯消毒液中30min→初步冲洗→包装→高压灭菌→于流动水用毛刷彻底刷洗→分类烘干→检查→上油→包装→再次高压消毒后保存无菌器械柜中备用。\r\n"+
                        "4.内镜手术器械的处理:\r\n"+
                        " 处理方法：卸下可移动的内镜部件、光学导线的连接配件、通道阀等→张开钳夹部位，以流动水冲洗衣面血迹、小刷轻轻刷洗→高压水枪冲洗关节部位、内腔通道，去除隐藏血迹或有机物→浸泡于酶剂（腔镜专用清洗剂）的稀释液中2min，充分去除有机物→流动水再次冲洗→擦干→高压氧气或压缩空气吹干各部件水分→专用润滑剂直接喷于器械表面、轴节、内腔、弹簧部位，再用镜头纸擦去表面油迹→保存于专用仪器柜中。若为HBsAg阳性者，术后器械应先浸泡于0.33%戊二醛稀释液（2%戊二醛1份，加水5份）15min，然后再按上法清洗。");
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
                    $("#duty_name").val("1、负责手术室内所有区域整齐，每日必须用1：100的8.4消毒液或1：1000含氯消毒灵片擦拭、拖扫。\r\n"+
                        "2、手术间每日彻底清扫两遍，早晨必须在上班前进行清扫一遍地面、墙面、门、窗，物品表面（无影灯、手术床、柜、吸引器）等应随时清洁，连台手术之间、当天手术全部完毕，对手术间及时进行清洁消毒处理，每周末彻底清洁一遍。\r\n"+
                        " 3、手术间病人用的约束带、托手板、脚凳每周必须全部刷洗干净，手术中被血迹污染后要随时清洗干净备用。\r\n"+
                        "4、每天保持平车整洁、手把、护栏、床单元上的橡胶单无血污、无杂物，并用布单覆盖。\r\n"+
                        "5、手术室大门处的脚垫，每日上下午必须用1：100的8.4消毒液喷洒，每周对垫子彻底清洗一次。\r\n"+
                        "6、每天清洗并消毒手中所使用的拖鞋，并于每周末彻底洗消一次。\r\n"+
                        "7、每天清洗洗手小毛巾，并负责配制消毒液（1：1000的含氯消毒灵片）及桶的清洁卫生。\r\n"+
                        "8、每天清洗洗手衣裤，送洗手衣裤消毒及收回，并负责准备。");
                    break;
                case 2:
                    $("#duty_name").val("（参考母猫绝育）1.1器械 剖腹产器械一套\r\n"+
                        "1.2 麻醉 用“846”合剂按每公斤0.04肌肉注射全麻，呈仰卧位保定。必须保证麻醉药物不注漏，药物全部进入机体本身。\r\n"+
                        "1.3 术前准备 剖腹产手术器械一套，经高压蒸汽灭菌。手术人员的手、手臂及手术部位均用0.1%新洁尔灭溶液消毒。术前对术部进行剃毛，碘酊消毒后，再用酒精棉脱碘消毒。\r\n"+
                        "1.4 切口位置的确定 脐后腹中线切口,切口长约5-10cm。手术中如需要可再扩大切口。\r\n"+
                        "1.5 术式 用手术刀分别切开皮肤，皮下组织，及腹白线。由助手持镊子配合提起腹膜切一小口，然后术者将左手的食指和中指伸入腹腔贴住腹膜，用钝头剪延长腹腔的切口，然后术者伸\r\n" +
                        "入食指和中指探查右侧子宫角，并将子宫角拉出切口，用生理盐水纱布覆盖在子宫上，用手抓持固定，以防回到腹腔内。术者继续向切口外牵引子宫角，可显露出子宫角前端的卵巢，\r\n"+
                        "并继续向外牵引卵巢，即可显露卵巢悬吊韧带。左手牵引子宫角，右手的食指端向卵巢悬吊韧带的前方和背面进行钝性分离，以便显露足够长度的卵巢悬吊韧带。分离时应仔细，以防\r\n"+
                        "撕破卵巢动、静脉血管。然后用“三钳法”切断卵巢悬吊韧带。在卵巢系膜无血管区切一小口，经此切口对卵巢悬吊韧带装置三把止血钳。第一把止血在紧靠卵巢的悬吊韧带上钳头，依次\r\n"+
                        "在第一钳的外侧（即肾脏端）的悬吊韧带上装置第二把、第三把止血钳。这样就完全夹闭了卵巢悬吊韧带的动、静脉血管。在第一与第二把止血钳上面切断卵巢悬吊韧带和卵巢动、静脉血管，\r\n"+
                        "将右侧子宫角和卵巢全部拉出切口外，然后结扎卵巢悬吊韧带的断端，在紧靠第三把止血钳的近肾脏端的悬吊韧带上，用7号丝线结扎，当第一个结扣接近拉紧时，松去第三把止血钳，使线结恰好\r\n"+
                        "位于钳痕处，迅速拉紧结扎线并完成结扎，剪去线尾。用镊子夹持卵巢悬吊韧带断端的少许组织，再松开第二把止血钳，在确保断端无出血情况下送去镊子，卵巢悬吊韧带断端即缩回到腹腔内。\r\n"+
                        "将右侧子宫角拉出切口外，引出子宫体，从子宫体找到左侧子宫角，再按“三钳法”结扎和切断卵巢悬吊韧带。\r\n"+
                        "切断子宫体完整摘除卵巢和子宫：两侧卵巢和子宫角完全拉出切口外后，显露子宫体，子宫两侧的子宫动脉应进行双重结扎后切断。子宫体经结扎后切断。　\r\n"+
                        "腹壁切口缝合前检查断端有无出血，如有少量出血，可在断端用肾上腺素止血，同时清除腹腔内的血液，血凝块及其它异物。腹腔内投80万单位青霉素一支，\r\n"+
                        "缝合完后切口用碘酒消毒。\r\n"+
                        "1.7 术后治疗与护理：\r\n"+
                        "  ⑴5%葡萄糖60ml、Vc2ml、地米2mg*1支、氨苄青霉素0.5g、肌苷2ml、Vb62ml*1支，一次静脉滴注。每日一次，连续用3日。\r\n"+
                        "  ⑵每日两次对切口用碘酒消毒，防止切口感染。\r\n"+
                        "  ⑶加强饲养管理，饲喂易吸收和消化的食物，限制动物做剧烈活动。切口用纱布包扎，防止动物自身舔伤口。\r\n"+
                        "  ⑷7―10天拆线，外涂碘酊。");
                    break;
                case 3:
                    $("#duty_name").val("1.每天清洁磅秤上，CO2瓶上，栏杆上的灰尘，覆盖仪器上的帘子（腹腔镜、C臂、电刀）每月清洗一次，如有污染及时清洗。\r\n" +
                        "2.手术病人安全离开手术室后，及时准确处理手术间已用过的物品，并且对手术间进行紫外线空气消毒。如果该手术为感染手术，应视感染性质对术中所用物品器械和手术间进行相应的处理。\r\n"+
                        "3.负责术后器械与器械室人员清点交接，锐利及精细器械物品应单独放置并且单独交班，以免刺伤碰撞损坏，并给予相应处理。\r\n"+
                        "4.防止因器械不良或不足造成手术意外。手术前器械护士应根据手术需要准备好器械，并检查器械的性能是否良好。如遇特殊或较大手术应提前一日备好特殊器械。\r\n"+
                        "5.防止器械、纱布、缝针和缝线遗留于伤口内。手术开始前、伤口缝合前、伤口缝合后以及手术结束前，器械护士和巡回护士要认真核对器械、纱布、缝针和缝线的数目。" );
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
                    $("#pic_modal_img").attr('src', 'pictures/shoushushixiaodu.png');
                    break;

                case 2:
                    $("#pic_modal_img").attr('src', 'pictures/jueyu.png');
                    break;

                case 3:
                    $("#pic_modal_img").attr('src', 'pictures/qixieqingxi.png');
                    break;

                default:
                    break;
            }

            $("#pic_modal" ).modal("show");
        }



        function judge(id)
        {

            switch(id) {
                case 1:
                    $("#flow_video").attr('src', 'http://www.w3school.com.cn/i/movie.ogg');
                    break;

                case 2:
                    $("#flow_video").attr('src', 'http://www.w3school.com.cn/i/movie.ogg');
                    break;

                case 3:
                    $("#flow_video").attr('src', 'http://www.w3school.com.cn/i/movie.ogg');
                    break;

                default:
                    break;
            }

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
            <li class="active">手术室管理</li>
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
                            <td id="case_type_1">手术室消毒</td>
                            <td><button class="btn btn-success" onclick="content(1)">查看</button></td>
                            <td><button class="btn btn-primary" onclick="welcome(1)">查看</button></td>
                            <td><button class="btn btn-danger" onclick="check(1)">查看</button></td>
                            <td><button class="btn btn-warning" onclick="judge(1)">查看</button></td>
                            <td><button class="btn btn-success" onclick="cure(1)">查看</button></td>
                            <td>失效</td>
                            <td><button class="btn btn-default" onclick="view(1)">修改</button></td>
                        </tr>

                        <tr>
                            <td id="case_type_2">绝育手术</td>
                            <td><button class="btn btn-success" onclick="content(2)">查看</button></td>
                            <td><button class="btn btn-primary" onclick="welcome(2)">查看</button></td>
                            <td><button class="btn btn-danger" onclick="check(2)">查看</button></td>
                            <td><button class="btn btn-warning" onclick="judge(2)">查看</button></td>
                            <td><button class="btn btn-success" onclick="cure(2)">查看</button></td>
                            <td>有效</td>
                            <td><button class="btn btn-default" onclick="view(2)">修改</button></td>
                        </tr>

                        <tr>
                            <td id="case_type_3">手术器械保管清洗</td>
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
                <video id="flow_video" width="568" height="444" src=""  autoplay="autoplay" preload="none">123</video>
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
