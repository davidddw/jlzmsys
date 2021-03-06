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
        <table id="dg" style="height: 100%;width:100%;"></table>
    </div>
</div>
<script type="text/javascript">
    var datagridJson = {
        "total": 28,
        "rows": [{
            "productid": "FI-SW-01",
            "productname": "Koi",
            "unitcost": 10.00,
            "status": "P",
            "listprice": 36.50,
            "attr1": "Large",
            "itemid": "EST-1"
        }, {
            "productid": "K9-DL-01",
            "productname": "Dalmation",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 18.50,
            "attr1": "Spotted Adult Female",
            "itemid": "EST-10"
        }, {
            "productid": "RP-SN-01",
            "productname": "Rattlesnake",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 38.50,
            "attr1": "Venomless",
            "itemid": "EST-11"
        }, {
            "productid": "RP-SN-01",
            "productname": "Rattlesnake",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 26.50,
            "attr1": "Rattleless",
            "itemid": "EST-12"
        }, {
            "productid": "RP-LI-02",
            "productname": "Iguana",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 35.50,
            "attr1": "Green Adult",
            "itemid": "EST-13"
        }, {
            "productid": "K9-DL-01",
            "productname": "Dalmation",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 18.50,
            "attr1": "Spotted Adult Female",
            "itemid": "EST-10"
        }, {
            "productid": "RP-SN-01",
            "productname": "Rattlesnake",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 38.50,
            "attr1": "Venomless",
            "itemid": "EST-11"
        }, {
            "productid": "RP-SN-01",
            "productname": "Rattlesnake",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 26.50,
            "attr1": "Rattleless",
            "itemid": "EST-12"
        }, {
            "productid": "RP-LI-02",
            "productname": "Iguana",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 35.50,
            "attr1": "Green Adult",
            "itemid": "EST-13"
        }, {
            "productid": "FL-DSH-01",
            "productname": "Manx",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 158.50,
            "attr1": "Tailless",
            "itemid": "EST-14"
        }, {
            "productid": "FL-DSH-01",
            "productname": "Manx",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 83.50,
            "attr1": "With tail",
            "itemid": "EST-15"
        }, {
            "productid": "FL-DLH-02",
            "productname": "Persian",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 23.50,
            "attr1": "Adult Female",
            "itemid": "EST-16"
        }, {
            "productid": "FL-DLH-02",
            "productname": "Persian",
            "unitcost": 12.00,
            "status": "P",
            "listprice": 89.50,
            "attr1": "Adult Male",
            "itemid": "EST-17"
        }, {
            "productid": "AV-CB-01",
            "productname": "Amazon Parrot",
            "unitcost": 92.00,
            "status": "P",
            "listprice": 63.50,
            "attr1": "Adult Male",
            "itemid": "EST-18"
        }]
    }
    $('#dg').datagrid({
        //url: 'js/data/datagrid_data.json',
        data: datagridJson,
        pagination: true,
        rownumbers: true,
        striped: true,
        pageSize: 10,
        pageList: [10,20,30],
        fitColumns: true,
        singleSelect: true,
        toolbar: [{
            text: '添加',
            iconCls: 'fa fa-plus',
            handler: function() {}
        }, {
            text: '编辑',
            iconCls: 'fa fa-edit',
            handler: function() {}
        }, {
            text: '保存',
            iconCls: 'fa fa-save',
            handler: function() {}
        },{
            text: '删除',
            iconCls: 'fa fa-remove',
            handler: function() {}
        }],

        columns: [
            [{
                field: 'productid',
                title: 'productid',
                width: 100,
                sortable: true
            }, {
                field: 'productname',
                title: 'productname',
                width: 100,
                sortable: true
            }, {
                field: 'unitcost',
                title: 'unitcost',
                width: 100,
                align: 'right',
                sortable: true
            }, {
                field: 'status',
                title: 'status',
                width: 100,
                align: 'right'
            }, {
                field: 'listprice',
                title: 'listprice',
                width: 100,
                align: 'right'
            }, {
                field: 'attr1',
                title: 'attr1',
                width: 100,
                align: 'right'
            }, {
                field: 'itemid',
                title: 'itemid',
                width: 100,
                align: 'right'
            }]
        ]
    });
</script>
</body>
</html>
