<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
	</head>

	<body>
		<div class="super-theme-example">
			<a id="myWin-btn2" href="javascript:void(0)" class="easyui-linkbutton info">选择窗口</a>
			<a id="myWin-btn3" href="javascript:void(0)" class="easyui-linkbutton success">警告窗口</a>
			<a id="myWin-btn5" href="javascript:void(0)" class="easyui-linkbutton warning">提示窗口</a>
			
		</div>
		<script type="text/javascript">
			$("#myWin-btn2").on('click', function() {
				$.messager.confirm('确认', '您确认想要删除记录吗？', function(r) {
					if(r) {
						alert('确认删除');
					}
				});
			});
			$("#myWin-btn3").on('click', function() {
				//error,question,info,warning
				$.messager.alert('警告', '警告消息', 'warning', function() {
					$.messager.alert('警告', '警告消息2', 'error');
				});
			});
			$("#myWin-btn5").on('click', function() {
				$.messager.prompt('提示信息', '请输入姓名：', function(r) {
					if(r) {
						alert('你的姓名是：' + r);
					}
				});
			});

		
		</script>
	</body>

</html>