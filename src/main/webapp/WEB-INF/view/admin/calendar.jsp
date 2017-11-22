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
                <input id="calendarFilter" name="calendarFilter" class="easyui-datebox" style="width: 150px;height:25px;" editable="false">
                <a href="javascript:searchCalendar()" class="easyui-linkbutton" iconCls="fa fa-search" style="height:25px;">検索</a>
            </div>
        </div>
        <table id="calendarDataGrid" style="height: 100%;width:100%;"></table>
    </div>
    <div id="calendar-info-dialog" class="easyui-dialog" style="width: 400px" closed="true" buttons="#calendar-dlg-buttons">
        <form id="calendar-info-form" method="post" novalidate style="margin: 0; padding: 50px 50px 20px">
            <div style="margin-bottom: 20px">
                <input name="ymd" class="easyui-textbox" style="width: 90%" label="年月日:" required="true">
            </div>
            <div style="margin-bottom: 20px">
                <input name="hldSgn" id="hldSgn" class="easyui-combobox" style="width: 90%" label='休日:' required="true"
                       url='getHldSgn' valueField='code' textField='codeName'>
            </div>
            <div style="margin-bottom: 20px">
                <input name="memo" class="easyui-textbox" style="width: 90%" label="備考:" required="true">
            </div>
            <input name="id" type="hidden" value="" />
        </form>
    </div>
    <div id="calendar-dlg-buttons">
        <a href="#" class="easyui-linkbutton success" iconCls="fa fa-check" onclick="saveCalendar()" style="width: 80px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton error" iconCls="fa fa-close" onclick="javascript:$('#calendar-info-dialog').dialog('close')"
           style="width: 110px">キャンセル</a>
    </div>
    <div id="uploadCalendarDlg" class="easyui-dialog" title="入力" style="width:400px;height:130px;padding:25px;" data-options="closed:true">
        <form id="uploadCalendarForm" method="post" enctype="multipart/form-data">
            <div class="form-item">
                <label for="" class="label-top">文件选择：</label>
                <input class="easyui-filebox" id="uploadExcel" name="uploadExcel" data-options="buttonText:'上传',buttonIcon:'fa fa-upload'"
                       style="width:200px;">
                <a href="javascript:importCalendar()" class="easyui-linkbutton" iconCls="fa fa-check">入力</a>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    $('#calendarDataGrid').datagrid({
        cache:false,
        url: 'listCalendar',
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
            {field:'ymd',title:'年月日',width:'150px'},
            {field:'hldSgn',title:'休日',width:'200px'},
            {field:'memo',title:'備考',width:'150px'}
        ]],
        toolbar: [{
            text: '修正',
            iconCls: 'fa fa-edit',
            handler: function() {
                var row = $('#calendarDataGrid').datagrid('getSelected');
                if (row) {
                    $('#calendar-info-dialog').dialog('open').dialog('center').dialog('setTitle', '修正図書');
                    url = 'getCalendar?id=' + row.id;
                    $('#calendar-info-form').form('load', url);
                }
            }
        }, {
            text: '出力',
            iconCls: 'fa fa-download',
            handler: function() {
                window.location.href="exportCalendar";
            }
        },{
            text: '入力',
            iconCls: 'fa fa-upload',
            handler: function() {
                $('#uploadCalendarDlg').dialog('open').dialog('center').dialog('setTitle', '入力');
            }
        }]
    });

    function importCalendar() {
        $("#uploadCalendarForm").form("submit", {
            url : 'importCalendar',
            success : function(data) {
                var data = $.parseJSON(data);
                if (data.success) {
                    $.messager.alert("提示", "入力成功");
                    $("#uploadCalendarDlg").dialog("close");
                    $("#calendarDataGrid").datagrid("reload");
                } else {
                    $.messager.alert("提示", "入力失敗");
                }
            }
        })
    }
    function saveCalendar() {
        $('#calendar-info-form').form('submit', {
            url: 'saveCalendar',
            dataType: 'json',
            onSubmit: function(){
                return $(this).form('validate');
            },
            success: function(data){
                //alert(data);
                var data = $.parseJSON(data);
                if (data.success) {
                    $('#calendar-info-dialog').dialog('close');
                    window.parent.$("#calendarDataGrid").datagrid("reload");
                } else {
                    $.messager.alert("提示", "更新失敗");
                }
            }
        });
    }
    function searchCalendar() {
        $('#calendarDataGrid').datagrid('reload', {
            filter : $("#calendarFilter").val()
        });
    }
    $(function(){
        $('#calendarFilter').datebox({
            onShowPanel: function() {
                span.trigger('click');
                if(!tds) {
                    setTimeout(function() {
                        tds = p.find('div.calendar-menu-month-inner td');
                        tds.click(function(e){
                            e.stopPropagation();
                            var year = /\d{4}/.exec(span.html())[0],
                                month = parseInt($(this).attr('abbr'), 10);
                            $('#calendarFilter').datebox('hidePanel').datebox('setValue', year +'-' +month);
                        });
                    }, 0);
                }
            },
            parser: function(s) {
                if(!s) return new Date();
                var arr = s.split('-');
                return new Date(parseInt(arr[0], 10), parseInt(arr[1], 10) -1, 1);
            },
            formatter: function(d) {
                var currentMonth = d.getMonth()+1;
                var currentMonthStr = currentMonth < 10 ? ('0' + currentMonth) :(currentMonth + '');
                return d.getFullYear() + '-' + currentMonthStr;
            }
        });
        var p = $('#calendarFilter').datebox('panel');
        tds = false;
        span = p.find('span.calendar-text');
        var curr_time = new Date();
        $('#calendarFilter').datebox('setValue', myformatter(curr_time));

    });

    function myformatter(date) {
        var y = date.getFullYear();
        var m = date.getMonth() +1;
        return y + '-' + m;
    }
</script>
</body>
</html>