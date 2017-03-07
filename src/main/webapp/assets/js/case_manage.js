function welcome_modify(id)
{
    $.post("/webapp/test_welcome_modify.php",
        {
            data : id
        },
        function(data,status)
        {
            alert(data);
        });
}

function welcome(id)
{
    $("#welcome_name").val($("#case_name_"+id).text());
    $("#welcome_pic_list").empty();
    $("#welcome_video_list").empty();
    $("#welcome_submit").attr("onclick","welcome_modify("+id+")");
    $.post("./test_pic_return.php",
        {
            welcome_id : id
        },
        function(data,status)
        {

            json1 = eval("("+data+")");
            for(i= 0;i<json1.length;i+=3)
            {
                welcome_row = '<div class = "row">';
                for(j=0;j<3;j++)
                {
                    welcome_row+='<div class="col-xs-4"><img style="width:100px;height: 100px" class="img-square" src="./assets/images/'+json1[i+j].pic+'"/><div class="closeLayer"  onClick="alert(1)"><img src="./assets/images/close.jpeg" style="width:15px;height: 15px"/></div></div>';
                }
                welcome_row +="</div>";
                $("#welcome_pic_list").append(welcome_row);

            }
        });

    $.post("./test_pic_return.php",
        {
            welcome_id : id
        },
        function(data,status)
        {

            json1 = eval("("+data+")");
            for(i= 0;i<json1.length;i+=3)
            {
                welcome_row = '<div class = "row">';
                for(j=0;j<3;j++)
                {
                    welcome_row+='<div class="col-xs-4"><img style="width:100px;height: 100px" class="img-square" src="./assets/images/'+json1[i+j].pic+'"/><div class="closeLayer"  onClick="alert(1)"><img src="./assets/images/close.jpeg" style="width:15px;height: 15px"/></div></div>';
                }
                welcome_row +="</div>";
                $("#welcome_video_list").append(welcome_row);

            }
        });
    $("#welcome_choose_pic_button").attr("onclick","welcome_pic_upload("+id+")");
    $("#welcome_choose_video_button").attr("onclick","welcome_video_upload("+id+")");
    $("#welcome_modal").modal("show");
}

function welcome_pic_upload(id)
{
    $.post("./test_pic_list.php",
        {
        },
        function(data,status)
        {
            $("#pic_table").empty();
            json1 = eval("("+data+")");
            for(i= 0;i<json1.length;i+=3)
            {
                welcome_row = '<tr>';
                for(j=0;j<3;j++)
                {
                    welcome_row+='<td><input name="pic_box" type="checkbox" value="'+json1[i+j].id+'"><img style="width:100px;height: 100px" class="img-square" src="./assets/images/'+json1[i+j].pic+'"/></td>';
                }
                welcome_row +="</tr>";
                $("#pic_table").append(welcome_row);
            }
        });
    $("#welcome_modal").modal("hide");
    $("#pic_upload_button").attr("onclick","upload_pic("+id+",1)");
    $("#pic_modal").modal("show");

}

function welcome_video_upload(id)
{
    $.post("./test_pic_list.php",
        {
        },
        function(data,status)
        {
            $("#video_table").empty();//少了个模态框
            json1 = eval("("+data+")");
            for(i= 0;i<json1.length;i+=3)
            {
                welcome_row = '<tr>';
                for(j=0;j<3;j++)
                {
                    welcome_row+='<td><input name="pic_box" type="checkbox" value="'+json1[i+j].id+'"><img style="width:100px;height: 100px" class="img-square" src="./assets/images/'+json1[i+j].pic+'"/></td>';
                }
                welcome_row +="</tr>";
                $("#video_table").append(welcome_row);
            }
        });
    $("#welcome_modal").modal("hide");
    $("#video_upload_button").attr("onclick","upload_video("+id+",1)");
    $("#video_modal").modal("show");

}

function upload_pic(id,type)
{
    pic_list = "";
    $("input[name='pic_box']:checked").each(function () { //由于复选框一般选中的是多个,所以可以循环输出选中的值
        pic_list =pic_list+ ","+($(this).val());
    });
    $.post("./test_pic_list_selected.php",
        {
            id : id,
            type : type,
            pic_list : pic_list
        },
        function(data,status)
        {
            alert(data);
        });
    $("#pic_modal").modal("hide");
    switch (type)
    {
        case 1:
            welcome(id);break;
        case 2:
            check(id);break;
        default:
            break;
    }
}

function upload_video(id,type)
{
    video_list = "";
    $("input[name='video_box']:checked").each(function () { //由于复选框一般选中的是多个,所以可以循环输出选中的值
        video_list =video_list+ ","+($(this).val());
    });
    $.post("./test_pic_list_selected.php",
        {
            id : id,
            type : type,
            video_list : video_list
        },
        function(data,status)
        {
            alert(data);
        });
    switch (type)
    {
        case 1:
            welcome(id);break;
        case 2:
            check(id);break;
        default:
            break;
    }
}


function check(id)
{
    $("#check_name").val($("#case_name_"+id).text());
    $("#check_pic_list").empty();
    $("#check_video_list").empty();
    $("#check_submit").attr("onclick","check_modify("+id+")");
    $.post("./test_pic_return.php",
        {
            check_id : id
        },
        function(data,status)
        {

            json1 = eval("("+data+")");
            for(i= 0;i<json1.length;i+=3)
            {
                check_row = '<div class = "row">';
                for(j=0;j<3;j++)
                {
                    check_row+='<div class="col-xs-4"><img style="width:100px;height: 100px" class="img-square" src="./assets/images/'+json1[i+j].pic+'"/><div class="closeLayer"  onClick="alert(1)"><img src="./assets/images/close.jpeg" style="width:15px;height: 15px"/></div></div>';
                }
                check_row +="</div>";
                $("#check_pic_list").append(check_row);

            }
        });

    $.post("./test_pic_return.php",
        {
            check_id : id
        },
        function(data,status)
        {

            json1 = eval("("+data+")");
            for(i= 0;i<json1.length;i+=3)
            {
                check_row = '<div class = "row">';
                for(j=0;j<3;j++)
                {
                    check_row+='<div class="col-xs-4"><img style="width:100px;height: 100px" class="img-square" src="./assets/images/'+json1[i+j].pic+'"/><div class="closeLayer"  onClick="alert(1)"><img src="./assets/images/close.jpeg" style="width:15px;height: 15px"/></div></div>';
                }
                check_row +="</div>";
                $("#check_video_list").append(check_row);

            }
        });
    $("#check_choose_pic_button").attr("onclick","check_pic_upload("+id+")");
    $("#check_choose_video_button").attr("onclick","check_video_upload("+id+")");
    $("#check_modal").modal("show");
}

function check_pic_upload(id)
{
    $.post("./test_pic_list.php",
        {
        },
        function(data,status)
        {
            $("#pic_table").empty();
            json1 = eval("("+data+")");
            for(i= 0;i<json1.length;i+=3)
            {
                check_row = '<tr>';
                for(j=0;j<3;j++)
                {
                    check_row+='<td><input name="pic_box" type="checkbox" value="'+json1[i+j].id+'"><img style="width:100px;height: 100px" class="img-square" src="./assets/images/'+json1[i+j].pic+'"/></td>';
                }
                check_row +="</tr>";
                $("#pic_table").append(check_row);
            }
        });
    $("#check_modal").modal("hide");
    $("#pic_upload_button").attr("onclick","upload_pic("+id+",1)");
    $("#pic_modal").modal("show");

}

function check_video_upload(id)
{
    $.post("./test_pic_list.php",
        {
        },
        function(data,status)
        {
            $("#video_table").empty();//少了个模态框
            json1 = eval("("+data+")");
            for(i= 0;i<json1.length;i+=3)
            {
                check_row = '<tr>';
                for(j=0;j<3;j++)
                {
                    check_row+='<td><input name="pic_box" type="checkbox" value="'+json1[i+j].id+'"><img style="width:100px;height: 100px" class="img-square" src="./assets/images/'+json1[i+j].pic+'"/></td>';
                }
                check_row +="</tr>";
                $("#video_table").append(check_row);
            }
        });
    $("#check_modal").modal("hide");
    $("#video_upload_button").attr("onclick","upload_video("+id+",1)");
    $("#video_modal").modal("show");

}


function judge(id)
{
    $("#judge_modal").modal("show");
}

function cure(id)
{
    $("#cure_modal").modal("show");
}

function view(id)
{
    $("#view_modal").modal("show");
}