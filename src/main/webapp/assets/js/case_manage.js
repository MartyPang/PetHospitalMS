function main(id) {
    //清空列表
    $("#welcome_pic_list").empty();
    $("#welcome_video_list").empty();
    $("#check_pic_list").empty();
    $("#check_video_list").empty();
    $("#judge_pic_list").empty();
    $("#judge_video_list").empty();
    $("#cure_pic_list").empty();
    $("#cure_video_list").empty();

    $("#modify_case_button").attr("onclick", "modifyCase(" + id + ")");
    //获取病例信息
    $.post("/getCaseInfo.action", {
            case_id: id
        },

        function(data, status) {
            //病例名
            $("#case_name").val(data.case_name);
            $("#welcome_name").val(data.case_name);
            $("#check_name").val(data.case_name);
            $("#judge_name").val(data.case_name);
            $("#cure_name").val(data.case_name);

            //病例类型
            selected_id = data.casetype_id;
            var selOpts = $("#casetype_select_modi option");
            selOpts.remove();
            $.post("/getCaseTypeList.action", {},
                function(data, status) {
                    var result = data.Result;
                    if (result == 'OK') {
                        var jsonArray = data.Records;
                        for (var i = 0; i < jsonArray.length; ++i) {
                            casetype_id = jsonArray[i].casetype_id;
                            casetype_name = jsonArray[i].casetype_name;
                            if (casetype_id == selected_id) {
                                $('#casetype_select_modi').append("<option value='" + casetype_id + "' selected='selected'>" + casetype_name + "</option>");
                            } else {
                                $('#casetype_select_modi').append("<option value='" + casetype_id + "'>" + casetype_name + "</option>");
                            }
                        }
                    }
                });

            //病例文字信息
            $("#welcome_text").val(data.reception_des);
            $("#check_text").val(data.examination_des);
            $("#judge_text").val(data.diagnosis_des);
            $("#cure_text").val(data.treatment_des);

            //病例已选图片
            welcome_img_ids = data.reception_pic;
            img_filter = '';
            if (welcome_img_ids.length > 0) {

                img_filter = "in (" + welcome_img_ids.substr(1) + ")"
            } else {
                img_filter = "in (-1)";
                welcome_img_ids = 0;
            }
            fillPicRow('welcome_pic_list', img_filter);

            check_img_ids = data.examination_pic;
            img_filter = '';
            if (check_img_ids.length > 0) {
                img_filter = "in (" + check_img_ids.substr(1) + ")"
            } else {
                img_filter = "in (-1)";
                check_img_ids = 0;
            }
            fillPicRow('check_pic_list', img_filter);

            judge_img_ids = data.diagnosis_pic;
            img_filter = '';
            if (judge_img_ids.length > 0) {
                img_filter = "in (" + judge_img_ids.substr(1) + ")"
            } else {
                img_filter = "in (-1)";
                judge_img_ids = 0;
            }
            fillPicRow('judge_pic_list', img_filter);

            cure_img_ids = data.treatment_pic;
            img_filter = '';
            if (cure_img_ids.length > 0) {
                img_filter = "in (" + cure_img_ids.substr(1) + ")"
            } else {
                img_filter = "in (-1)";
                cure_img_ids = 0;
            }
            fillPicRow('cure_pic_list', img_filter);

            //病例已选视频
            welcome_video_ids = data.reception_video;
            v_filter = '';
            if (welcome_video_ids.length > 0) {
                v_filter = "in (" + welcome_video_ids.substr(1) + ")"
            } else {
                v_filter = "in (-1)";
                welcome_video_ids = 0;
            }
            fillVideoRow('welcome_video_list', v_filter);

            check_video_ids = data.examination_video;
            v_filter = '';
            if (check_video_ids.length > 0) {
                v_filter = "in (" + check_video_ids.substr(1) + ")"
            } else {
                v_filter = "in (-1)";
                check_video_ids = 0;
            }
            fillVideoRow('check_video_list', v_filter);

            judge_video_ids = data.diagnosis_video;
            v_filter = '';
            if (judge_video_ids.length > 0) {
                v_filter = "in (" + judge_video_ids.substr(1) + ")"
            } else {
                v_filter = "in (-1)";
                judge_video_ids = 0;
            }
            fillVideoRow('judge_video_list', v_filter);

            cure_video_ids = data.treatment_video;
            v_filter = '';
            if (cure_video_ids.length > 0) {
                v_filter = "in (" + cure_video_ids.substr(1) + ")"
            } else {
                v_filter = "in (-1)";
                cure_video_ids = 0;
            }
            fillVideoRow('cure_video_list', v_filter);

            //按钮绑定点击事件
            $("#welcome_choose_pic_button").attr("onclick", "show_pic_upload(" + id + ",'" + welcome_img_ids + "',1)");
            $("#welcome_choose_video_button").attr("onclick", "show_video_upload(" + id + ",'" + welcome_video_ids + "',1)");
            $("#check_choose_pic_button").attr("onclick", "show_pic_upload(" + id + ",'" + check_img_ids + "',2)");
            $("#check_choose_video_button").attr("onclick", "show_video_upload(" + id + ",'" + check_video_ids + "',2)");
            $("#judge_choose_pic_button").attr("onclick", "show_pic_upload(" + id + ",'" + judge_img_ids + "',3)");
            $("#judge_choose_video_button").attr("onclick", "show_video_upload(" + id + ",'" + judge_video_ids + "',3)");
            $("#cure_choose_pic_button").attr("onclick", "show_pic_upload(" + id + ",'" + cure_img_ids + "',4)");
            $("#cure_choose_video_button").attr("onclick", "show_video_upload(" + id + ",'" + cure_video_ids + "',4)");

            $("#main_modal").modal("show");

        });
}

//获取已有图片
function fillPicRow(pic_list_id, img_filter) {
    $.post("/getImageListByFilter.action", {
            filter: img_filter
        },
        function(data, status) {
            jsonArray = data.records;
            for (i = 0; i < jsonArray.length; i += 3) {
                pig_row = '<div class = "row">';
                for (j = 0; j < 3 && i + j < jsonArray.length; j++) {
                    pig_row += '<div class="col-xs-4"><img style="width:100px;height: 100px" class="img-square" src="' + jsonArray[i + j].img_s + '"/><div class="closeLayer"  onClick="alert(1)"><img src="./assets/images/close.jpeg" style="width:15px;height: 15px"/></div></div>';
                }
                pig_row += "</div>";
                $("#" + pic_list_id).append(pig_row);

            }
        });
}

//获取已有视频
function fillVideoRow(video_list_id, v_filter) {
    $.post("/getVideoListByFilter.action", {
            filter: v_filter
        },
        function(data, status) {
            jsonArray = data.records;
            for (i = 0; i < jsonArray.length; i += 3) {
                v_row = '<div class = "row">';
                for (j = 0; j < 3 && i + j < jsonArray.length; j++) {
                    v_row += '<div class="col-xs-4"><img style="width:100px;height: 100px" class="img-square" src="' + jsonArray[i + j].cover_img + '"/><div class="closeLayer"  onClick="alert(1)"><img src="./assets/images/close.jpeg" style="width:15px;height: 15px"/></div></div>';
                }
                v_row += "</div>";
                $("#" + video_list_id).append(v_row);

            }
        });
}

//获取可选图片
function show_pic_upload(case_id, img_ids, type) {
    img_filter = '';
    if (img_ids.length > 1) {
        img_filter = "not in (" + img_ids.substr(1) + ")"
    } else {
        img_filter = "not in (-1)";
    }
    $.post("/getVideoListByFilter.action", {
            filter: img_filter
        },
        function(data, status) {
            $("#pic_table").empty();
            jsonArray = data.records;
            for (i = 0; i < jsonArray.length; i += 3) {
                row = '<tr>';
                for (j = 0; j < 3; j++) {
                    row += '<td><input name="pic_box" type="checkbox" value="' + jsonArray[i + j].image_id + '"><img style="width:100px;height: 100px" class="img-square" src="' + jsonArray[i + j].img_s + '"/></td>';
                }
                row += "</tr>";
                $("#pic_table").append(row);
            }
        });
    $("#main_modal").modal("hide");
    $("#pic_upload_button").attr("onclick", "upload_pic(" + case_id + "," + img_ids + "," + type + ")");
    $("#pic_modal").modal("show");
}

//获取可选视频
function show_video_upload(case_id, v_ids, type) {
    v_filter = '';
    if (v_ids.length > 1) {
        v_filter = "not in (" + v_ids.substr(1) + ")"
    } else {
        v_filter = "not in (-1)";
    }
    $.post("/getVideoListByFilter.action", {
            filter: v_filter
        },
        function(data, status) {
            $("#video_table").empty();
            jsonArray = data.records;
            for (i = 0; i < jsonArray.length; i += 3) {
                row = '<tr>';
                for (j = 0; j < 3; j++) {
                    row += '<td><input name="video_box" type="checkbox" value="' + jsonArray[i + j].video_id + '"><img style="width:100px;height: 100px" class="img-square" src="' + jsonArray[i + j].cover_img + '"/></td>';
                }
                row += "</tr>";
                $("#video_table").append(row);
            }
        });
    $("#main_modal").modal("hide");
    $("#video_upload_button").attr("onclick", "upload_video(" + case_id + "," + v_ids + "," + type + ")");
    $("#video_modal").modal("show");
}

//更新所选图片
function upload_pic(case_id, img_ids, type) {
    pic_list = "";
    $("input[name='pic_box']:checked").each(function() { //由于复选框一般选中的是多个,所以可以循环输出选中的值
        pic_list = pic_list + "," + ($(this).val());
    });
    if (img_ids.length > 1) {
        img_ids = img_ids + pic_list;
    } else {
        //img_ids = 0;
        img_ids = pic_list;
    }
    $.post("/updateCImage.action", {
            case_id: id,
            p_type: type,
            p_list: pic_list
        },
        function(data, status) {
            $("#pic_modal").modal("hide");
            $("#pic_table").empty();
            pic_list = "";
            main(id);
        });

}

//更新所选视频
function upload_video(case_id, v_ids, type) {
    video_list = "";
    $("input[name='video_box']:checked").each(function() { //由于复选框一般选中的是多个,所以可以循环输出选中的值
        video_list = video_list + "," + ($(this).val());
    });
    if (v_ids.length > 1) {
        v_ids = v_ids + v_list;
    } else {
        v_ids = v_list;
    }
    $.post("/updaateCVideo.action", {
            case_id: case_id,
            v_type: type,
            v_list: v_ids
        },
        function(data, status) {
            $("#video_modal").modal("hide");
            $("#video_table").empty();
            video_list = "";
            main(id);
        });

}

function showAddModal() {
    var selOpts = $("#casetype_select option");
    selOpts.remove();
    $.post("/getCaseTypeList.action", {},
        function(data, status) {
            var result = data.Result;
            if (result == 'OK') {
                var jsonArray = data.Records;
                for (var i = 0; i < jsonArray.length; ++i) {
                    casetype_id = jsonArray[i].casetype_id;
                    casetype_name = jsonArray[i].casetype_name;
                    if (i == 0) {
                        $('#casetype_select').append("<option value='" + casetype_id + "' selected='selected'>" + casetype_name + "</option>");
                    } else {
                        $('#casetype_select').append("<option value='" + casetype_id + "'>" + casetype_name + "</option>");
                    }
                }
                $('#add_modal').modal('show');
            }
        });
}

function addCase() {
    casetype_id = $("#casetype_select").val();
    casetype_name = $("#casetype_select").find("option:selected").text();
    case_name = $("#case_name_new").val();
    reception_des = $("#reception_des_new").val();
    examination_des = $("#examination_des_new").val();
    diagnosis_des = $("#diagnosis_des_new").val();
    treatment_des = $("#treatment_des_new").val();
    if (case_name.length == 0) {
        x0p("提示", "请输入病例名");
        return;
    }
    if (reception_des.length == 0) {
        x0p("提示", "请输入病例接诊信息");
        return;
    }
    if (examination_des.length == 0) {
        x0p("提示", "请输入病例检查信息");
        return;
    }
    if (diagnosis_des.length == 0) {
        x0p("提示", "请输入病例诊断信息");
        return;
    }
    if (treatment_des.length == 0) {
        x0p("提示", "请输入治疗信息");
        return;
    }

    $.post("/addCaseee.action", {
            case_name: case_name,
            casetype_id: casetype_id,
            casetype_name: casetype_name,
            reception_des: reception_des,
            examination_des: examination_des,
            diagnosis_des: diagnosis_des,
            treatment_des: treatment_des
        },
        function(data, status) {
            if (data == 'true') {
                location.reload();
            }
        });
}

function modifyCase(case_id) {
    // body...
    casetype_id = $("#casetype_select_modi").val();
    casetype_name = $("#casetype_select_modi").find("option:selected").text();
    case_name = $("#case_name").val();
    reception_des = $("#welcome_text").val();
    examination_des = $("#check_text").val();
    diagnosis_des = $("#judge_text").val();
    treatment_des = $("#cure_text").val();
    if (case_name.length == 0) {
        x0p("提示", "请输入病例名");
        return;
    }
    if (reception_des.length == 0) {
        x0p("提示", "请输入病例接诊信息");
        return;
    }
    if (examination_des.length == 0) {
        x0p("提示", "请输入病例检查信息");
        return;
    }
    if (diagnosis_des.length == 0) {
        x0p("提示", "请输入病例诊断信息");
        return;
    }
    if (treatment_des.length == 0) {
        x0p("提示", "请输入治疗信息");
        return;
    }
    $.post("/updateCase.action", {
            case_id: case_id,
            case_name: case_name,
            casetype_id: casetype_id,
            casetype_name: casetype_name,
            reception_des: reception_des,
            examination_des: examination_des,
            diagnosis_des: diagnosis_des,
            treatment_des: treatment_des
        },
        function(data, status) {
            if (data == 'true') {
                location.reload();
            }
        });
}
