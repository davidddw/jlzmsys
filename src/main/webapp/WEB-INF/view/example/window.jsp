<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>

	<body>
		<div class="super-theme-example">
			<a id="myWin-btn" href="javascript:void(0)" class="easyui-linkbutton info">对话窗口</a>
			<div id="myWinDemo" style="display: none;">对话框窗口内容。</div>
			<a href="javascript:void(0)" class="easyui-linkbutton primary" onclick="$('#dlg').dialog('open')">打开工具栏窗口</a>
			<a href="javascript:void(0)" class="easyui-linkbutton primary" onclick="$('#dlg').dialog('close')">关闭工具栏窗口</a>
			<div id="dlg" class="easyui-dialog" title="Toolbar and Buttons" style="width:400px;height:200px;padding:10px;" data-options="
				toolbar: [{
					text:'Add',
					iconCls:'fa fa-plus',
					handler:function(){
					}
				},'-',{
					text:'Save',
					iconCls:'fa fa-save',
					handler:function(){
					}
				}],
				buttons: [{
					text:'Ok',
					iconCls:'fa fa-check',
					handler:function(){
					}
				},{
					text:'Cancel',
					iconCls:'fa fa-close',
					handler:function(){
						$('#dlg').dialog('close')
					}
				}],
				closed:true,
			">
				The dialog content.
			</div>
		</div>
		<script type="text/javascript">
            $("#myWin-btn").on('click', function() {
                $('#myWinDemo').window({
                    width: 500,
                    height: 300,
                    modal: true
                });
            });
		</script>
	</body>

</html>