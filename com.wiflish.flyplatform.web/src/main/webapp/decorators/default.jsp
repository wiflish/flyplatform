<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ include file="/common/taglibs.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <%@ include file="/common/meta.jsp"%>
    <title><decorator:title /> | <fmt:message key="webapp.name" /></title>
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/jquery-easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/jquery-easyui/themes/icon.css">
    <script type="text/javascript" src="${ctx}/resources/jquery/jquery-1.7.1.min.js"></script>
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
