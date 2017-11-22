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
        <div class="easyui-panel" style="width:100%;height:40px;padding:5px 10px;" data-options="iconCls:'fa fa-tags'">
            <div class="contentWrapper">
                部署: <input id=attdncDeptId name="deptId" class="easyui-combobox"
                           style="width: 100px;height:25px;" editable="false"
                           data-options="valueField:'CODE',textField:'CODE_NAME'">
                要員ID: <input id="attdncUserId" name="userId" class="easyui-combobox"
                             style="width: 80px;height:25px;" data-options="valueField:'USER_ID', textField:'USER_ID'">
                期間: <input value='${monday}' id="attdncStartTime" name="startTime"
                           class="easyui-datebox" editable="false" style="width: 115px;height:25px;">
                ~ <input value='${sunday}' id="attdncEndTime" name="endTime"
                         class="easyui-datebox" editable="false" style="width: 115px;height:25px;">
                勤怠过滤:
                <select class="easyui-combobox" name="codeMasterFilter"
                        id="attdncFilter" style="width: 120px;height:25px;" editable="false">
                    <option value="ALL">查询全部</option>
                    <option value="ABN">异常勤怠</option>
                    <option value="AN">正常勤怠</option>
                </select>
                <a href="javascript:codeMasterSearch()" class="easyui-linkbutton" iconCls="fa fa-search" style="height:25px;">検索</a>
                <input id="user_id" type="hidden" value="" />
            </div>
        </div>
        <table id="codeMasterDataGrid" style="height: 100%;width:100%;"></table>
    </div>
    <div id="codeMaster-info-dialog" class="easyui-dialog" style="width: 500px" closed="true" buttons="#codeMaster-dlg-buttons">
        <form id="codeMaster-info-form" method="post" novalidate style="margin: 0; padding: 50px 50px 20px">
            <div style="margin-bottom: 20px">
                <input name="type" id="type" class="easyui-textbox" style="width: 90%" label="タイプ（日本語名）:" required="required">
            </div>
            <div style="margin-bottom: 20px">
                <input name="typeEn" class="easyui-textbox" style="width: 90%" label="タイプ（英語名）:" required="required">
            </div>
            <div style="margin-bottom: 20px">
                <input name="codeName" class="easyui-textbox" style="width: 90%" label="コード値" required="required">
            </div>
            <div style="margin-bottom: 20px">
                <input name="code" class="easyui-textbox" style="width: 90%" label="コード:" required="required">
            </div>
            <input name="id" type="hidden" value="" />
        </form>
    </div>
    <div id="codeMaster-dlg-buttons">
        <a href="#" class="easyui-linkbutton success" iconCls="fa fa-check" onclick="saveOrUpdateCodeMaster()" style="width: 80px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton error" iconCls="fa fa-close" onclick="javascript:$('#codeMaster-info-dialog').dialog('close')"
           style="width: 110px">キャンセル</a>
    </div>
</div>
<script type="text/javascript">
    $('#codeMasterDataGrid').datagrid({
        cache:false,
        url: 'listCodeMaster',
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
            {field:'id',title:'id',width:'100px',hidden:true},
            {field:'type',title:'タイプ（日本語名）',width:'200px'},
            {field:'typeEn',title:'タイプ（英語名）',width:'150px'},
            {field:'codeName',title:'コード値',width:'150px'},
            {field:'code',title:'コード',width:'150px'}
        ]],
        toolbar: [{
            text: '新規',
            iconCls: 'fa fa-plus-square',
            handler: function() {
                $('#codeMaster-info-dialog').dialog('open').dialog('center').dialog('setTitle', '新規部署');
                $('#codeMaster-info-form').form('clear');
            }
        }, {
            text: '修正',
            iconCls: 'fa fa-edit',
            handler: function() {
                var row = $('#codeMasterDataGrid').datagrid('getSelected');
                if (row) {
                    $('#codeMaster-info-dialog').dialog('open').dialog('center').dialog('setTitle', '修正部署');
                    //$('#sn').textbox('textbox').attr('readonly', true);
                    url = 'getCodeMaster?id=' + row.id;
                    $('#codeMaster-info-form').form('load', url);
                }
            }
        }, {
            text: '削除',
            iconCls: 'fa fa-trash-o',
            handler: function() {
                var row = $('#codeMasterDataGrid').datagrid('getSelected');
                if (row) {
                    $.messager.confirm('提示', '确定削除该记录？' ,function(data) {
                        if(data) {
                            $.post('deleteCodeMaster', {'id': row.id} ,function(result) {
                                if(result.success) {
                                    $("#codeMasterDataGrid").datagrid("reload");
                                } else {
                                    $.messager.show({title: "提示", msg: "削除失敗"});
                                }
                            });
                        }
                    });
                }
            }
        },{
            text: '出力',
            iconCls: 'fa fa-download',
            handler: function() {
                window.location.href="exportCodeMaster";
            }
        }]
    });

    function saveOrUpdateCodeMaster() {
        $('#codeMaster-info-form').form('submit', {
            url: 'saveCodeMaster',
            dataType: 'json',
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(data){
                //alert(data);
                var data = $.parseJSON(data);
                if (data.success) {
                    $('#codeMaster-info-dialog').dialog('close');
                    window.parent.$("#codeMasterDataGrid").datagrid("reload");
                } else {
                    $.messager.alert("提示", "更新失敗");
                }
            }
        });
    }
    function departmentSearch() {
        $('#codeMasterDataGrid').datagrid('reload', {
            sn : $('#booksSnId').val(),
            filter : $("#codeMasterFilter").combobox('getValue')
        });
    }

</script>
</body>
</html>