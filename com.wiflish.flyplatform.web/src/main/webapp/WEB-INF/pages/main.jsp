<%@ include file="/common/taglibs.jsp"%>

<head>
<title><fmt:message key="mainMenu.title" /></title>
<meta name="heading" content="<fmt:message key='mainMenu.heading'/>" />
<meta name="menu" content="MainMenu" />
<link rel="stylesheet" type="text/css" href="${ctx}/resources/jquery-easyui/plugins/portal/portal.css">
<script type="text/javascript" src="${ctx}/resources/jquery-easyui/plugins/portal/jquery.portal.js"></script>
<script type="text/javascript">
    var panels = [
        {id:'p1',title:'Tutorials',height:200,collapsible:true,closable:true},
        {id:'p2',title:'Clock',height:200,closable:true},
        {id:'p3',title:'PropertyGrid',height:200,collapsible:true,closable:true},
        {id:'p4',title:'DataGrid',height:200,closable:true}
    ];

    function getCookie(name){
      var cookies = document.cookie.split(';');
      if (!cookies.length) return '';
      for(var i=0; i<cookies.length; i++){
          var pair = cookies[i].split('=');
          if ($.trim(pair[0]) == name){
              return $.trim(pair[1]);
          }
      }
      return '';
    }
    
    function getPanelOptions(id){
      for(var i=0; i<panels.length; i++){
          if (panels[i].id == id){
              return panels[i];
          }
      }
      return undefined;
    }
    
    function getPortalState(){
      var aa = [];
      for(var columnIndex=0; columnIndex<3; columnIndex++){
          var cc = [];
          var panels = $('#div-home-portal').portal('getPanels', columnIndex);
          for(var i=0; i<panels.length; i++){
              cc.push(panels[i].attr('id'));
          }
          aa.push(cc.join(','));
      }
      return aa.join(':');
    }
    
    function addPanels(portalState){
      var columns = portalState.split(':');
      for(var columnIndex=0; columnIndex<columns.length; columnIndex++){
          var cc = columns[columnIndex].split(',');
          for(var j=0; j<cc.length; j++){
              var options = getPanelOptions(cc[j]);
              if (options){
                  var p = $('<div/>').attr('id',options.id).appendTo('body');
                  p.panel(options);
                  $('#div-home-portal').portal('add',{
                      panel:p,
                      columnIndex:columnIndex
                  });
              }
          }
      }
    }
    
    $(function(){
      $('#div-home-portal').portal({
          fit:true,
          border:false,
          onStateChange:function(){
              var state = getPortalState();
              var date = new Date();
              date.setTime(date.getTime() + 24*3600*1000);
              document.cookie = 'portal-state='+state+';expires='+date.toGMTString();
          }
      });
    
      var state = getCookie('portal-state');
      if (!state){
          state = 'p1,p2:p3,p4';    // the default portal state
      }
    
      addPanels(state);
      $('#div-home-portal').portal('resize');
      
      $("#div-show-today").html("Welcome <security:authentication property='principal.firstName'/> <security:authentication property='principal.lastName'/>,Today is " + $.datepicker.formatDate("yy-mm-dd DD", new Date(), null ) );
      
      $("#a-logout").click(function (evt) {
          $.messager.confirm('Confirm','Are you sure you want to logout the system?',function(r){  
              if (r){  
                  location.replace('${ctx}/logout');
                  evt.returnValue=false;
              }
          });
      });
      
      $('#switchThemes').menubutton({
          plain:true
      });
    });

    function switchThemes(theme) {
        $("#theme-jqueryui").attr("href", "${ctx}/resources/jqueryui/themes/" + theme +"/jquery-ui-1.8.17.css");
        $("#theme-easyui").attr("href", "${ctx}/resources/jquery-easyui/themes/" + theme +"/easyui.css");
        
    }
    </script>
</head>

<body class="easyui-layout">
	<div region="north" style="height: 85px; border: 0;">
		<div class="easyui-layout" fit="true">
            <div region="center" style="border-bottom:0;border-top:0">Application Title</div>
            <div region="south" style="height:28px;background:#efefef;border-top:0;border-bottom:0">
                <div class="easyui-layout" fit="true">
                    <div region="west" style="width:300px;line-height: 25px;" border="false" id="div-show-today"></div>
                    <div region="center" style="line-height: 25px;" border="false">Function Shortcut</div>
                    <div region="east" style="width:400px;text-align: right;" border="false">
                        <a href="javascript: void(0);" id="switchThemes" class="easyui-menubutton" menu="#switchThemesMenu" iconCls="icon-switch-themes">Switch Themes</a>
                        <div id="switchThemesMenu" style="width:123px;">
                            <div iconCls="icon-theme-smoothness" onclick="javascript: switchThemes('smoothness');">smoothness</div>
                            <div iconCls="icon-theme-cupertino" onclick="javascript: switchThemes('cupertino');">cupertino</div>
                        </div>
                        <a href="#" class="easyui-linkbutton" iconCls="icon-modify-pwd" plain="true">ModifyPassword</a>
                        <a href="javascript: void(0);" id="a-logout" class="easyui-linkbutton" iconCls="icon-logout" plain="true">Logout</a>
                    </div>
                </div>
            </div>
        </div>
	</div>
	<div region="south" style="height: 35px; margin-top: 1px; background: #efefef;">
		<div style="text-align: center; line-height: 30px;">CopyRight &copy 2012 Wiflish</div>
	</div>
	<div region="west" title="West Menu" iconCls="icon-navigator" style="width: 260px; padding1: 1px; overflow: hidden;">
		<div id="div-accordion" class="easyui-accordion" fit="true" border="false">
            <div title="Title1" style="padding: 10px; overflow: auto;">
                <p>content1</p>
                <p>content1</p>
            </div>
            <div title="Title2" selected="true" style="padding: 10px;">
                content2</div>
            <div title="Title3" style="padding: 10px">content3</div>
		</div>
	</div>
	<div region="center" style="overflow: hidden;border-left:0">
		<div class="easyui-tabs" fit="true" border="false">
			<div title="Home" iconCls="icon-home" style="padding: 2px; overflow: hidden;">
				<div id="div-home-portal" style="position: relative">
					<div style="width: 30%;"></div>
					<div style="width: 40%;"></div>
					<div style="width: 30%;"></div>
				</div>
			</div>
		</div>
	</div>
</body>
