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
                           data-options="valueField:'CODE',textField:'CODE_NAME'">
                要員ID: <input id="attdncUserId" name="userId" class="easyui-combobox"
                             style="width: 80px;height:25px;" data-options="valueField:'USER_ID', textField:'USER_ID'">
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
                <input name="CODE_NAME" id="hld_sgn" class="easyui-combobox" style="width: 90%" label='勤怠区分:'
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
                <input id="hld_sgn" name="ATTDNC_CHG_RSN_DIV" class="easyui-combobox" style="width: 90%" label="修正理由:"
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
        cache:false,
        url: 'userList',
        method: 'post',
        iconCls: 'icon-save',
        pagination:true,
        pageSize:10,
        pageNumber:1,
        pageList: [10,20,30],
        fitColumns: true,
        singleSelect: true,
        rownumbers:true,
        striped:true,
        columns:[[
            {field:'userName',title:'要員',width:'100px',align:'left',halign:'center'},
            {field:'genDiv',title:'性別',width:'50px',align:'center',halign:'center'},
            {field:'deptName',title:'部署',width:'80px',halign:'center'},
            {field:'empDiv',title:'社員区分',width:'80px',align:'center',halign:'center'},
            {field:'accessionDate',title:'入社日',width:'90px',align:'center',halign:'center'},
            {field:'birthday',title:'生年月日',width:'90px',align:'center',halign:'center'},
            {field:'education',title:'学歴',width:'100px',align:'center',halign:'center'},
            {field:'graduateDate',title:'卒業日',width:'90px',align:'center',halign:'center'},
            {field:'japaneseLevel',title:'日本語レベル',width:'90px',align:'center',halign:'center'},
            {field:'jpDate',title:'JP合格日',width:'90px',align:'center',halign:'center'},
            {field:'phoneNumber',title:'携帯番号',width:'100px',halign:'center'},
            {field:'delSgn',title:'状態',width:'80px',align:'center',halign:'center'}
        ]],

        toolbar: [{
            text: '一括登録',
            iconCls: 'fa fa-upload',
            handler: function() {
                var row = $('#departmentDataGrid').datagrid('getSelected');
                if (row) {
                    $('#updateDepartmentDlg').dialog('open').dialog('center').dialog('setTitle', '修正勤怠');
                    $('#updateDepartmentForm').form('load', row);
                    url = 'updateAttendance?id=' + row.USER_NM + '&ymd=' + row.YMD;
                }
            }
        }, {
            text: '出力',
            iconCls: 'fa fa-download',
            handler: function() {}
        }, {
            text: '帳票出力',
            iconCls: 'fa fa-download',
            handler: function() {
                $('#uploadAttendanceDlg').dialog('open').dialog('center').dialog('setTitle', '入力');
            }
        },{
            text: '新規',
            iconCls: 'fa fa-plus-square',
            handler: function() {}
        },{
            text: '修正',
            iconCls: 'fa fa-edit',
            handler: function() {}
        },{
            text: '削除',
            iconCls: 'fa fa-trash-o',
            handler: function() {}
        }]
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