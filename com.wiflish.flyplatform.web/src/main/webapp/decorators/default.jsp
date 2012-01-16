<%@ include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">
<head>
    <%@ include file="/common/meta.jsp"%>
    <title><decorator:title /> | <fmt:message key="webapp.name" /></title>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/jqueryui/themes/cupertino/jquery-ui-1.8.17.css" id="theme-jqueryui">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/jquery-easyui/themes/cupertino/easyui.css" id="theme-easyui">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="${ctx}/resources/jquery/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/jqueryui/jquery-ui-1.8.17.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/jquery/plugins/enhancingforms/jquery.enhancingforms.js"></script>
    <script type="text/javascript" src="${ctx}/resources/jquery/plugins/jquery.ui.datepicker.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/jquery/plugins/jquery.ui.datepicker-zh-CN.js"></script>
    <script type="text/javascript" src="${ctx}/resources/jquery-easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/resources/jquery-easyui/locale/easyui-lang-zh_CN.js"></script>
    <decorator:head />
</head>
<body <decorator:getProperty property="body.id" writeEntireProperty="true"/><decorator:getProperty property="body.class" writeEntireProperty="true"/>>
	<decorator:body />
</body>
</html>
