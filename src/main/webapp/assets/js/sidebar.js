/**
 * Created by Marty Pang on 2017/3/14.
 */

(function() {
    $.post("/getDepartmentList.action", {},
        function(data, status) {
            $("#sub-item-basic").empty();
            $("#sub-item-basic").append("<li><a href='/preDepartmentManage.action'><span class='glyphicon glyphicon-share-alt'></span> 科室管理</a></li>");
            var result = data.Result;
            if (result == 'OK') {
                var jsonArray = data.Records;
                for (var i = 0; i < jsonArray.length; ++i) {
                    dpm_name = jsonArray[i].dpm_name;
                    //console.log(dpm_name);
                    //dpm_name = encodeURIComponent(dpm_name);
                    dpm_id = jsonArray[i].dpm_id;
                    $("#sub-item-basic").append("<li><a href='preProcessManage.action?dpm_id="+dpm_id+"'><span class='glyphicon glyphicon-share-alt'></span> " + dpm_name + "</a></li>");
                }
            }
        });
})();
