<?php
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/select2_metro.css" />';
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/DT_bootstrap.css" />';
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
									<?php foreach($memberData as $member){?>
										<tr class="odd gradeX">
											<td><input type="checkbox" class="checkboxes" value="1" /></td>
											<td><?=$member['memberid']?></td>
											<td class="hidden-480"><?=$member['member_name']?></td>
											<td class="hidden-480"><?=$member['member_phone']?></td>
											<td class="center hidden-480"><?=$member['member_address']?></td>
											<td ><span class="label label-success"><?=$member['member_idcard']?></span></td>
											<td><a href="#">删除</a> | <a href="#">修改</a></td>
										</tr>
									<?}?>
									</tbody>

								</table>

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
$js_include[] = '<script type="text/javascript" src="/js/demo/table_managed.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>

<script>

</script>