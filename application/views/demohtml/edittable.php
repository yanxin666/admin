<?php
$css_include[] = '<link href="/css/select2_metro.css" rel="stylesheet" type="text/css" />';
$css_include[] = '<link href="/css/DT_bootstrap.css" rel="stylesheet" type="text/css" />';
?>

<?php include VIEWPATH . 'header.php' ?>
<!-- BEGIN PAGE CONTENT-->
	<div class="row-fluid">
		<div class="span12">
			<!-- BEGIN EXAMPLE TABLE PORTLET-->
				<div class="portlet box blue">
					<div class="portlet-title">
						<div class="caption"><i class="icon-edit"></i>配置类型</div>
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
									<button id="sample_editable_1_new" class="btn green">
										添加 <i class="icon-plus"></i>
									</button>
								</div>
								<div class="btn-group pull-right">
									<button class="btn dropdown-toggle" data-toggle="dropdown">工具 <i class="icon-angle-down"></i>
									</button>
									<ul class="dropdown-menu pull-right">
										<li><a href="#">打印</a></li>
										<li><a href="#">保存PDF格式</a></li>
										<li><a href="#">导入或导出</a></li>
									</ul>
								</div>
							</div>
							<table class="table table-striped table-hover table-bordered" id="sample_editable_1">
								<thead>
								    <tr>
										<th>字段value</th>
										<th>字段name</th>
										<th>修改</th>
										<th>删除</th>
									</tr>
								</thead>
								<tbody>
								<?php  foreach ($test as $k){?>
									<tr class="">
										<td><?php echo $k['colorjian']; ?></td>
										<td class="center" id="valuetd"><?php echo $k['colorzhi']; ?></td>
										<td><a class="edit" href="javascript:;">修改</a></td>
										<td><a class="delete" href="javascript:;">删除</a></td>
									</tr>
								<?php } ?>
								</tbody>
							</table>
						</div>
					</div>
				<!-- END EXAMPLE TABLE PORTLET-->
			</div>			
	</div>
<!-- END PAGE CONTENT-->
<?php
$js_include[] = '<script type="text/javascript" src="/js/jquery-migrate-1.2.1.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/select2.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/jquery.dataTables.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/DT_bootstrap.js"></script>';
//$js_include[] = '<script type="text/javascript" src="/js/table-editable.js"></script>';
$js_include[] = '<script src="/js/demo/edittable.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>
<script>
	jQuery(document).ready(function() {       
		 // App.init();
		  TableEditable.init();
	});
</script>