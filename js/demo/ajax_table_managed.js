jQuery(document).ready(function() {
	
	//alert(typeof(jQuery().dataTable));
	
    if (!jQuery().dataTable) {
        return;
        }

    // begin first table
            $('#sample_1').dataTable({
				//"bStateSave": true, 	//允许浏览器缓存Datatables，以便下次恢复之前的状态
				"bProcessing": true,	//显示加载信息
				"bServerSide": true,	//开启服务器模式
				
				//使用ajax源
				"sAjaxSource": "/index.php?c=demo&m=ajax_data",
				
				//"sServerMethod": "POST",
				
				/* 从 Ajax 源加载数据的表的内容 如果加"type": "POST"，则使用post方式传递数据*/
				"fnServerData": function ( sSource, aoData, fnCallback ) {
					$.ajax( {
						"dataType": 'json',
						"type": "POST",
						"url": sSource,
						"data": aoData,
						"success": fnCallback
					} );
				},
				
				
				/* $_GET['sColumns']/$_POST['sColumns']将接收到aoColumns传递的数据
				"aoColumns": [
					{ "sName": "field1" },
					{ "sName": "field2" },
					{ "sName": "field3" },
					{ "sName": "field4" },
					{ "sName": "field5" }
				],
				*/
				
				//排序控制
                "aoColumns": [
                  { "bSortable": false },
                  null,
                  null,
                  null,
                  null,
                  null,
				  { "bSortable": false }
                ],
				
				//定义每页显示数据数量数组
                "aLengthMenu": [
                    [5, 10, 15, 20, -1],
                    [5, 10, 15, 20, "全部"] 	//每页变化值
                ],
				
                "iDisplayLength": 5,	//设置datatables的默认显示条数
				
				"sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>", //改变页面上元素的位置
				
                "sPaginationType": "bootstrap",		//显示数字的翻页样式
				
				//改变语言提示
                "oLanguage": {
                    "sLengthMenu": "每页 _MENU_ 条记录",
					"sZeroRecords": "抱歉，没有找到",
					"sInfo": "从 _START_ 到 _END_ / 共 _TOTAL_ 条数据",
					"sInfoEmpty": "没有数据",
					"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                    "oPaginate": {
						"sFirst": "首页",
                        "sPrevious": "上一页",
                        "sNext": "下一页",
						"sLast": "尾页"
                    },
					//显示正在处理字符串
					"sProcessing": "正在加载中<img src='/images/loading.gif' />"
                },
				
				//隐藏某些列
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });


			jQuery('#sample_1 .group-checkable').change(function () {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                    } else {
                        $(this).attr("checked", false);
                    }
                });
                jQuery.uniform.update(set);
            });

            jQuery('#sample_1_wrapper .dataTables_filter input').addClass("m-wrap medium"); // modify table search input
            jQuery('#sample_1_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#sample_1_wrapper .dataTables_length select').select2(); // initialzie select2 dropdown

			
	$("#uploadStart").click(function(){
		$("#upload_file_excel").submit();
	});
	
});