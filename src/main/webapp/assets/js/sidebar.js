/**
 * Created by Marty Pang on 2017/3/14.
 */

(function() {
    $.post("/getDepartmentList.action", {},
        function(data, status) {
            $("#sub-item-basic").empty();
            $("#sub-item-basic").append("<li><a href='./room_management.jsp'><span class='glyphicon glyphicon-share-alt'></span> 科室管理</a></li>");
            var result = data.Result;
            if (result == 'OK') {
                var jsonArray = data.Records;
                for (var i = 0; i < jsonArray.length; ++i) {
                    dpm_name = jsonArray[i].dpm_name;
                    $("#sub-item-basic").append("<li><a href='preProcessManage.action?dpm="+dpm_name+"'><span class='glyphicon glyphicon-share-alt'></span> " + dpm_name + "</a></li>");
                }
            }
        });
})();
