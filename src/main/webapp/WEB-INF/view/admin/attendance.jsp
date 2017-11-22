<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>
<div class="super-theme-example">
	<div class="stretchedToMargin">
		<div class="easyui-panel" style="width:100%;height:40px;padding:5px 10px;" 
			data-options="iconCls:'fa fa-tags'">
			<div class="contentWrapper">
				部署: <input id=attdncDeptId name="deptId" class="easyui-combobox"
				style="width: 100px;height:25px;" editable="false"
				data-options="valueField:'CODE',textField:'CODE_NAME',url:'deptIdList'">
				要員ID: <input id="attdncUserId" name="userId" class="easyui-combobox"
				style="width: 80px;height:25px;" data-options="valueField:'USER_ID', textField:'USER_ID'">
				期間: <input value='${monday}' id="attdncStartTime" name="startTime"
				class="easyui-datebox" editable="false" style="width: 115px;height:25px;">
				~ <input value='${sunday}' id="attdncEndTime" name="endTime"
				class="easyui-datebox" editable="false" style="width: 115px;height:25px;">
				勤怠过滤: 
				<select class="easyui-combobox" name="attdncFilter" 
				id="attdncFilter" style="width: 120px;height:25px;" editable="false">
					<option value="ALL">查询全部</option>
					<option value="ABN">异常勤怠</option>
					<option value="AN">正常勤怠</option>
				</select>
				<a href="javascript:attdncSearch()" class="easyui-linkbutton" iconCls="fa fa-search" 
				style="height:25px;">検索</a>
				<input id="user_id" type="hidden" value="" />
			</div>
		</div>
        <table id="attendanceDataGrid" style="height: 100%;width:100%;"></table>
    </div>
    <div id="updateAttendanceDlg" class="easyui-dialog" style="width: 400px" closed="true" buttons="#dlg-buttons">
		<form id="updateAttendanceForm" method="post" novalidate style="margin: 0; padding: 50px 50px 20px">
			<div style="margin-bottom: 20px">
				<input name="USER_NM" class="easyui-textbox" style="width: 90%" label="要員:" readonly="true">
			</div>
			<div style="margin-bottom: 20px">
				<input name="CODE_NAME" id="hld_sgn" class="easyui-combobox" style="width: 90%" label='勤怠区分:' url='getAttdncDiv'
					valueField='CODE' textField='CODE_NAME'>
			</div>
			<div style="margin-bottom: 20px">
				<input name="YMD" class="easyui-textbox" style="width: 90%" label="日期:" readonly="true">
			</div>
			<div style="margin-bottom: 20px">
				<input name="STRWK_TIME" class="easyui-timespinner" id="str_time"
					style="width: 56%;" label="時間:" required="true" showSeconds="true"
					onChange="planstrtime"> ~ <input name="ENDWK_TIME"
					class="easyui-timespinner" id="end_time" style="width: 27%;"
					required="true" showSeconds="true" onChange="planstrtime">
			</div>
			<div style="margin-bottom: 20px">
				<input id="hld_sgn" name="ATTDNC_CHG_RSN_DIV" class="easyui-combobox" style="width: 90%" label="修正理由:" url='getAttdncRSNDiv' 
					valueField='CODE' textField='CODE_NAME'>
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="ATTDNC_CHG_RSN_CONT" style="width: 90%; height: 80px" label='修正理由その他:' 
					required="true" multiline="true">
			</div>
		</form>
	</div>
	<div id="dlg-buttons">
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="updateAttdnc()" style="width: 90px">更新</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')"
			style="width: 90px">キャンセル</a>
	</div>
	<div id="uploadAttendanceDlg" class="easyui-dialog" title="入力" style="width:400px;height:130px;padding:25px;" 
		data-options="closed:true">
		<form id="uploadAttendanceForm" method="post" enctype="multipart/form-data">
			<div class="form-item">
				<label for="" class="label-top">文件选择：</label>
				<input class="easyui-filebox" id="uploadExcel" name="uploadExcel" data-options="buttonText:'上传',buttonIcon:'fa fa-upload'" 
				style="width:200px;">
				<a href="javascript:attendanceImport()" class="easyui-linkbutton" iconCls="fa fa-check">入力</a>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
    $('#attendanceDataGrid').datagrid({
        //url: 'js/data/datagrid_data.json',
        //data: datagridJson,
        pagination: true,
        rownumbers: true,
        striped: true,
        pageSize: 10,
        pageList: [10,20,30],
        fitColumns: true,
        singleSelect: true,
        toolbar: [{
			text: '修正',
			iconCls: 'fa fa-edit',
			handler: function() {
				var row = $('#attendanceDataGrid').datagrid('getSelected');
				if (row) {
					$('#updateAttendanceDlg').dialog('open').dialog('center').dialog('setTitle', '修正勤怠');
					$('#updateAttendanceForm').form('load', row);
					url = 'updateAttendance?id=' + row.USER_NM + '&ymd=' + row.YMD;
				}
			}
		}, {
			text: '出力',
			iconCls: 'fa fa-upload',
			handler: function() {}
		}, {
			text: '入力',
			iconCls: 'fa fa-download', 
			handler: function() {
				$('#uploadAttendanceDlg').dialog('open').dialog('center').dialog('setTitle', '入力');
			}
		},{
			text: '同期',
			iconCls: 'fa fa-recycle',
			handler: function() {}
		},{
			text: 'E-Mail',
			iconCls: 'fa fa-envelope-o',
			handler: function() {}
		}],
		columns : [ 
			[{
				field : 'YMD',
				title : '日付',
				width : '100px',
				formatter: function(value, row, index) {
					return value.substr(0,4) + '/' + value.substr(4,2) + '/' + value.substr(6,2);
				}
			}, {
				field : 'USER_NM',
				title : '要員',
				width : '120px'
			}, {
				field : 'CODE_NAME',
				title : '区分',
				width : '90px'
			}, {
				field : 'STRWK_TIME',
				title : '始業時刻',
				width : '80px'
			}, {
				field : 'ENDWK_TIME',
				title : '終業時刻',
				width : '80px'
			}, {
				field : 'LATE_TIME',
				title : '遅刻（分）',
				width : '80px'
			}, {
				field : 'EARLY_TIME',
				title : '早退（分）',
				width : '80px'
			}, {
				field : 'ABSENT_HOURS',
				title : '欠勤（時）',
				width : '80px'
			}, {
				field : 'OVTMWK_TIME',
				title : '残業（時）',
				width : '80px'
			}, {
				field : 'WK_TIME',
				title : '倒休（天）',
				width : '80px'
			}, {
				field : 'WK_TIME',
				title : '请假（天）',
				width : '80px'
			}, {
				field : 'WK_TIME',
				title : '未刷次数',
				width : '80px'
			}, {
				field : 'WK_TIME',
				title : '未带卡',
				width : '80px'
			}, {
				field : 'WK_TIME',
				title : '勤務（時）',
				width : '80px'
			}, {
				field : 'CODE_NAME1',
				title : '勤怠取込結果',
				width : '135px'
			}] 
		],
		rowStyler: function(index, row) {
			if(row.CODE_NAME1!='正常勤怠') {
				return 'color:#F00;font-weight:bold';
			}
		}
    });
    
    function load() {
		$("<div class=\"datagrid-mask\"></div>")
			.css({display:"block",width:"100%",height:$(window).height()})
			.appendTo("body");
		$("<div class=\"datagrid-mask-msg\"></div>")
			.html("正在同期记录，请稍后...").appendTo("body")
			.css({display:"block",
				left:($(document.body).outerWidth(true)-190)/2,
				top:($(window).height()-45)/2});
	}
	function disLoad() {
		$(".datagrid-mask").remove();
		$(".datagrid-mask-msg").remove();
	}
	function attendanceImport() {
		$("#uploadAttendanceForm").form("submit", {
			url : 'attendanceImport',
			success : function(data) {
				if (data == "success") {
					$.messager.alert("提示", "入力成功");
					$("#attdncImportDiv").dialog("close");
					$("#attdncImportDiv").dialog("refresh");
					window.parent.$("#attdncTable").datagrid("reload");
				} else {
					$.messager.alert("提示", "入力失敗");
				}
			}
		})
	}
</script>
</body>
</html>