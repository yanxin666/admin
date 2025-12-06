<?php
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/select2_metro.css" />';
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/DT_bootstrap.css" />';

$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.10.1.custom.min.css" />';
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/bootstrap-modal.css" />';
?>

<?php include VIEWPATH . 'header.php' ?>


				<!-- BEGIN PAGE CONTENT-->
				
				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN EXAMPLE TABLE PORTLET-->

						<div class="portlet box light-grey">

							<div class="portlet-title">

								<div class="caption"><i class="icon-globe"></i>Managed Table</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body">

								<div class="clearfix">

									<div class="btn-group">

										<button id="sample_editable_1_new" class="btn green" onClick='location="/index.php?c=demo&m=formtable1"'>

										添加 <i class="icon-plus"></i>

										</button>

									</div>

									<div class="btn-group pull-right">

										<button class="btn dropdown-toggle" data-toggle="dropdown">
											工具 <i class="icon-angle-down"></i>
										</button>

										<ul class="dropdown-menu pull-right">
											<li><a href="#">打印</a></li>
											<li><a href="#">保存成 PDF</a></li>
											<li><a href="#">Excel导出</a></li>
											<li><a class="btn blue" data-toggle="modal" href="#excelUpload">Excel导入</a></li>
										</ul>

									</div>

								</div>

								<table class="table table-striped table-bordered table-hover" id="sample_1">

									<thead>
										<tr>
											<th style="width:8px;">
												<input type="checkbox" class="group-checkable" data-set="#sample_1 .checkboxes" />
											</th>
											<th>MID</th>
											<th class="hidden-480">会员名称</th>
											<th class="hidden-480">移动电话</th>
											<th class="hidden-480">会员地址</th>
											<th >身份证号</th>
											<th >操作</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td colspan="7">正在加载数据</td>
										</tr>
									</tbody>
								</table>
								
								
								<div id="excelUpload" class="modal hide fade" tabindex="-1" data-width="760">

									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

										<h3>Excel导入</h3>

									</div>
									<form id="upload_file_excel" action="/index.php?c=demo&m=upload_file" method="post" enctype="multipart/form-data" > 
									<div class="modal-body">

										<div class="row-fluid">

											<div class="span6">

												<h4>选择文件</h4>

												<p><input type="file" name="upfile" class="span12 m-wrap"></p>

											</div>
										</div>

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Close</button>

										<button type="button" class="btn blue" id="uploadStart">上传</button>
										
									</div>
									</form>
								</div>

							</div>

						</div>

						<!-- END EXAMPLE TABLE PORTLET-->

					</div>

				</div>

				<!-- END PAGE CONTENT-->
<?php
$js_include[] = '<script type="text/javascript" src="/js/select2.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/jquery.dataTables.js"></script>';

$js_include[] = '<script type="text/javascript" src="/js/DT_bootstrap.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/demo/ajax_table_managed.js"></script>';

$js_include[] = '<script src="/js/bootstrap-modal.js" type="text/javascript" ></script>';
$js_include[] = '<script src="/js/bootstrap-modalmanager.js" type="text/javascript" ></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>

<script>

</script>