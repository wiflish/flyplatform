<%@ include file="/common/taglibs.jsp"%>

<head>
    <title><fmt:message key="login.title"/></title>
    <meta name="heading" content="<fmt:message key='login.heading'/>"/>
    <meta name="menu" content="Login"/>
    <script type="text/javascript">
    $(function () {
        $("form").form({  
            url: '${ctx}/j_security_check',  
            onSubmit: function(){
                // do some check  
                // return false to prevent submit;  
            },  
            success:function(data){  
                location.href='${ctx}';
            }
        });

        $("form").uiForm();
    });
    </script>
    <style type="text/css">
    body {
        background:#E2E2E2;
    }
    .button {
        width: 65px;
        height:28px;
    }
    </style>
</head>
<body>
<div id="div-login-window" class="easyui-window" collapsible="false" minimizable="false" closable="false"
        maximizable="false" draggable="false" resizable="false" title="Login" iconCls="icon-save" style="width:400px;height:235px;padding:2px;">
    <div class="easyui-layout" fit="true">
        <div region="center" border="false" style="padding:10px;background: #fff;border:1px solid #ccc;">
            <h2>Welcome to FlyPlatform! Please Login.</h2>
            <c:if test="${param.error != null}">
                <div class="error">
                    <img src="${ctx}/images/iconWarning.gif" alt="<fmt:message key='icon.warning'/>" class="icon"/>
                    <fmt:message key="errors.password.mismatch"/>
                    <%--${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}--%>
                </div>
            </c:if>
            <form method="post" id="loginForm" action="<c:url value='/j_security_check'/>">
            <table style="width: 98%;">
                <tr>
                    <th><label for="j_username"><fmt:message key="label.username"/>: </label></th>
                    <td><input type="text" name="j_username" id="j_username" tabindex="1" /></td>
                </tr>
                <tr>
                    <th><label for="j_password"><fmt:message key="label.password"/>: </label></th>
                    <td><input type="password" name="j_password" id="j_password" tabindex="2"></td>
                </tr>
                <c:if test="${appConfig['rememberMeEnabled']}">
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input type="checkbox" name="_spring_security_remember_me" id="rememberMe" tabindex="3"/>
                        <label for="rememberMe"><fmt:message key="login.rememberMe"/></label>
                    </td>
                </tr>
                </c:if>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" name="login" class="button" value="<fmt:message key='button.login'/>" tabindex="4" />
                        <input type="reset" name="reset" class="button" value="<fmt:message key='button.reset'/>" tabindex="5" />
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</div>
</body>