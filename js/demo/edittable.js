var TableEditable = function () {

    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();
            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                jqTds[0].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[0] + '">';
                jqTds[1].innerHTML = '<input type="text" class="m-wrap small" value="' + aData[1] + '">';
                jqTds[2].innerHTML = '<a class="edit" href="">保存</a>';
                jqTds[3].innerHTML = '<a class="cancel" href="">取消</a>';
            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate('<a class="edit" href="">修改</a>', nRow, 2, false);
                oTable.fnUpdate('<a class="delete" href="">删除</a>', nRow, 3, false);
                oTable.fnDraw();
                $.ajax({
            		url:"/index.php?c=xiaoyingDemo&m=updatemsg",
                	type:"post",
                	dataType:"json",
                	async: false,
                	data:{
                		colorjian:function(){
                			return jqInputs[0].value;
                			//alert(jqInputs[0].value);
                		},
				        colorzhi:function(){
							return jqInputs[1].value;
                			//alert(jqInputs[1].value);
						}
                	} ,               	
            	});
            }          

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate('<a class="edit" href="">修改</a>', nRow, 2, false);
                oTable.fnDraw();
            }
            
            function deleteRow(nRow){
            	var nRow1 = nRow.getElementsByTagName('td')[0].innerHTML;
                $.ajax({
            		url:"/index.php?c=xiaoyingDemo&m=deletemsg",
                	type:"post",
                	dataType:"json",
                	async: false,
                	data:{
                		colorjian:function(){
                			return nRow1;
                		}
                	},               	
            	});
            }

            var oTable = $('#sample_editable_1').dataTable({
                "aLengthMenu": [
                    [5, 15, 20, -1],
                    [5, 15, 20, "全部"] // change per page values here
                ],
                // set the initial value
                "iDisplayLength": 5,
                "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
                "sPaginationType": "bootstrap",
                "oLanguage": {
                	"sLengthMenu": "每页 _MENU_ 条记录",
					"sZeroRecords": "抱歉，没有找到",
					"sInfo": "从 第 _START_ 页 到 第 _END_ 页 共 _TOTAL_ 条数据",
					"sInfoEmpty": "没有数据",
					"sInfoFiltered": "(从 _MAX_ 条数据中检索)",
                    "oPaginate": {
						"sFirst": "首页",
                        "sPrevious": "上一页",
                        "sNext": "下一页",
						"sLast": "尾页"
                    },
                },
                "aoColumnDefs": [{
                        'bSortable': false,
                        'aTargets': [0]
                    }
                ]
            });

            jQuery('#sample_editable_1_wrapper .dataTables_filter input').addClass("m-wrap medium"); // modify table search input
            jQuery('#sample_editable_1_wrapper .dataTables_length select').addClass("m-wrap small"); // modify table per page dropdown
            jQuery('#sample_editable_1_wrapper .dataTables_length select').select2({
                showSearchInput : false //hide search box with special css class
            }); // initialzie select2 dropdown

            var nEditing = null;

            $('#sample_editable_1_new').click(function (e) {
                e.preventDefault();
                var aiNew = oTable.fnAddData(['', '',
                        '<a class="edit" href="">保存</a>', '<a class="cancel" data-mode="new" href="">取消</a>'
                ]);
                var nRow = oTable.fnGetNodes(aiNew[0]);
                editRow(oTable, nRow);
                nEditing = nRow;
            });

            $('#sample_editable_1 a.delete').live('click', function (e) {
                e.preventDefault();
                if (confirm("你确定要删除这条记录吗 ?") == false) {
                    return;
                } 
                var nRow = $(this).parents('tr')[0];
                oTable.fnDeleteRow(nRow);
                deleteRow(nRow);
                alert("删除成功!");
            });

            $('#sample_editable_1 a.cancel').live('click', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });

            $('#sample_editable_1 a.edit').live('click', function (e) {
                e.preventDefault();
                /* Get the row as a parent of the link that was clicked on */
                var nRow = $(this).parents('tr')[0];
                if (nEditing !== null && nEditing != nRow) {
                    /* Currently editing - but not this row - restore the old before continuing to edit mode */
                    restoreRow(oTable, nEditing);
                    editRow(oTable, nRow);
                    nEditing = nRow;
                } else if (nEditing == nRow && this.innerHTML == "保存") {
                    /* Editing this row and want to save it */
                    saveRow(oTable, nEditing);
                    nEditing = null;
                    alert("更新成功!");
                } else {
                    /* No edit in progress - let's start one */
                    editRow(oTable, nRow);
                    nEditing = nRow;
                }
            });
        }

    };

}();