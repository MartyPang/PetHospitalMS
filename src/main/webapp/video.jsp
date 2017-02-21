<%@ include file="taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.0//EN" "http://www.wapforum.org/DTD/xhtml-mobile10.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="${ctx}/assets/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/custom/css/syntax.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/custom/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/webuploader-0.1.5/webuploader.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/custom/css/demo.css">
</head>
<body>
<div id="wrapper">
    <div class="page-body">

        <div id="post-container" class="container">
            <div class="page-container">
                <div id="uploader" class="wu-example">
                    <div class="queueList">
                        <div id="dndArea" class="placeholder">
                            <div id="filePicker"></div>
                            <p>或将照片拖到这里，单次最多可选300张</p>
                        </div>
                    </div>
                    <div class="statusBar" style="display:none;">
                        <div class="progress">
                            <span class="text">0%</span>
                            <span class="percentage"></span>
                        </div><div class="info"></div>
                        <div class="btns">
                            <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${ctx}/assets/bootstrap-3.3.7-dist/js/jquery-3.1.1.js"></script>
<script src="${ctx}/assets/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/assets/webuploader-0.1.5/webuploader.js"></script>
<script type="text/javascript" src="${ctx}/assets/custom/js/demo.js"></script>
</body>
</html>
