function addType() {
    $("#add_type_modal").modal("show");
}

function modifyType(id) {
    $.post('./getCaseTypeInfo.action', {
            casetype_id: id
        },
        function(data, status) {
            $("#casetype_id").text(data.casetype_id);
            $("#modify_type_name").val(data.casetype_name);
            $("#modify_type_desc").val(data.casetype_desc);
            $("#status").val(data.status);
            $("#modify_type_modal").modal("show");
        });

}
//添加病例类型
function new_case_type_submit() {
    var casetype_name = $('#new_type_name').val();
    var casetype_desc = $('#new_type_desc').val();

    if (casetype_name.length == 0) {
        x0p("提示", "请输入病例类型名");
        return;
    }
    if (casetype_desc.length == 0) {
        x0p("提示", "请输入病例类型描述");
        return;
    }

    $.post('./addCaseType.action', {
            casetype_name: casetype_name,
            casetype_desc: casetype_desc
        },
        function(data, status) {
            if (data == 'true') {
                window.location.href = "example_management.html";
            }
        });
}
//修改病例类型
function modify_case_type_submit() {
    casetype_id = $("#casetype_id").text();
    casetype_name = $("#modify_type_name").val();
    casetype_desc = $("#modify_type_desc").val();
    status = $("#status").val();

    if (casetype_name.length == 0) {
        x0p("提示", "请输入病例类型名");
        return;
    }
    if (casetype_desc.length == 0) {
        x0p("提示", "请输入病例类型描述");
        return;
    }

    $.post('./updateCaseType.action', {
            casetype_id: casetype_id,
            casetype_name: casetype_name,
            casetype_desc: casetype_desc,
            status: status
        },
        function(data, status) {
            if (data == 'true') {
                window.location.href = "example_management.html";
            }
        })
}
