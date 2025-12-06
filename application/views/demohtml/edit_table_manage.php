<?php
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/select2_metro.css" />';
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/DT_bootstrap.css" />';

$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.10.1.custom.min.css" />';
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/bootstrap-modal.css" />';

$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/uniform.default.css" />';
?>

<?php include VIEWPATH . 'header.php' ?>

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN EXAMPLE TABLE PORTLET-->

						<div class="portlet box blue">

							<div class="portlet-title">

								<div class="caption"><i class="icon-edit"></i>Editable Table</div>

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

										Add New <i class="icon-plus"></i>

										</button>

									</div>

									<div class="btn-group pull-right">

										<button class="btn dropdown-toggle" data-toggle="dropdown">Tools <i class="icon-angle-down"></i>

										</button>

										<ul class="dropdown-menu pull-right">

											<li><a href="#">Print</a></li>

											<li><a href="#">Save as PDF</a></li>

											<li><a href="#">Export to Excel</a></li>

										</ul>

									</div>

								</div>

								<table class="table table-striped table-hover table-bordered" id="sample_editable_1">

									<thead>

										<tr>

											<th>Username</th>

											<th>Full Name</th>

											<th>Points</th>

											<th>Notes</th>

											<th>Edit</th>

											<th>Delete</th>

										</tr>

									</thead>

									<tbody>

										<tr class="">

											<td>alex</td>

											<td>Alex Nilson</td>

											<td>1234</td>

											<td class="center">power user</td>

											<td><a class="edit" href="javascript:;">Edit</a></td>

											<td><a class="delete" href="javascript:;">Delete</a></td>

										</tr>

										<tr class="">

											<td>lisa</td>

											<td>Lisa Wong</td>

											<td>434</td>

											<td class="center">new user</td>

											<td><a class="edit" href="javascript:;">Edit</a></td>

											<td><a class="delete" href="javascript:;">Delete</a></td>

										</tr>

									</tbody>

								</table>

							</div>

						</div>

						<!-- END EXAMPLE TABLE PORTLET-->

					</div>

				</div>

				<!-- END PAGE CONTENT -->


<?php
$js_include[] = '<script type="text/javascript" src="/js/select2.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/jquery.dataTables.js"></script>';

$js_include[] = '<script type="text/javascript" src="/js/DT_bootstrap.js"></script>';

$js_include[] = '<script src="/js/bootstrap-modal.js" type="text/javascript" ></script>';
$js_include[] = '<script src="/js/bootstrap-modalmanager.js" type="text/javascript" ></script>';

$js_include[] = '<script type="text/javascript" src="/js/demo/edit_table_manage.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>

<script>
// jQuery(document).ready(function() {       
	// TableEditable.init();
	// });
</script>