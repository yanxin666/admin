<?php
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/jquery-ui-1.10.1.custom.min.css" />';
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/bootstrap-modal.css" />';
?>

<?php include VIEWPATH . 'header.php' ?>


				<!-- BEGIN PAGE CONTENT-->
				
				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN PORTLET-->   

						<div class="portlet box green">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>Bootstrap Extended Modals</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

									<a href="javascript:;" class="reload"></a>

								</div>

							</div>

							<div class="portlet-body form">

								<table class="table table-hover table-striped table-bordered">

									<tr>

										<td>Responsive</td>

										<td><a class="btn blue" data-toggle="modal" href="#responsive">View Demo</a></td>

									</tr>

									<tr>

										<td>Stackable</td>

										<td><a class=" btn green" data-toggle="modal" href="#stack1">View Demo</a></td>

									</tr>

									<tr>

										<td>AJAX (via jQuery.load)</td>

										<td><a class=" btn red" id="modal_ajax_demo_btn" data-toggle="modal">View Demo</a></td>

									</tr>

									<tr>

										<td>Static Background with Animation</td>

										<td><a class=" btn yellow" data-toggle="modal" href="#static">View Demo</a></td>

									</tr>

									<tr>

										<td>Full Width</td>

										<td><a class=" btn purple btn-large" data-toggle="modal" href="#full-width">View Demo</a></td>

									</tr>

									<tr>

										<td>Long Modals</td>

										<td><a class=" btn blue btn-large" data-toggle="modal" href="#long">View Demo</a></td>

									</tr>

								</table>

								<div id="responsive" class="modal hide fade" tabindex="-1" data-width="760">

									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

										<h3>Responsive</h3>

									</div>

									<div class="modal-body">

										<div class="row-fluid">

											<div class="span6">

												<h4>Some Input</h4>

												<p><input type="text" class="span12 m-wrap"></p>

											</div>

											<div class="span6">

												<h4>Some More Input</h4>

												<p><input type="text" class="span12 m-wrap"></p>

											</div>

										</div>

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Close</button>

										<button type="button" class="btn blue">Save changes</button>

									</div>

								</div>

								<div id="stack1" class="modal hide fade" tabindex="-1" data-focus-on="input:first">

									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

										<h3>Stack One</h3>

									</div>

									<div class="modal-body">

										<p>One fine body…</p>

										<p>One fine body…</p>

										<p>One fine body…</p>

										<input type="text" class="m-wrap" data-tabindex="1">

										<input type="text" class="m-wrap" data-tabindex="2">

										<a class="btn green" data-toggle="modal" href="#stack2">Launch modal</a>

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Close</button>

										<button type="button" class="btn red">Ok</button>

									</div>

								</div>

								<div id="stack2" class="modal hide fade" tabindex="-1" data-focus-on="input:first">

									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

										<h3>Stack Two</h3>

									</div>

									<div class="modal-body">

										<p>One fine body…</p>

										<p>One fine body…</p>

										<input type="text" class="m-wrap" data-tabindex="1">

										<input type="text" class="m-wrap" data-tabindex="2">

										<a class="btn red" data-toggle="modal" href="#stack3">Launch modal</a>

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Close</button>

										<button type="button" class="btn yellow">Ok</button>

									</div>

								</div>

								<div id="stack3" class="modal hide fade" tabindex="-1" data-focus-on="input:first">

									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

										<h3>Stack Three</h3>

									</div>

									<div class="modal-body">

										<p>One fine body…</p>

										<input type="text" class="m-wrap" data-tabindex="1">

										<input type="text" class="m-wrap" data-tabindex="2">

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Close</button>

										<button type="button" class="btn purple">Ok</button>

									</div>

								</div>

								<div id="static" class="modal hide fade" tabindex="-1" data-backdrop="static" data-keyboard="false">

									<div class="modal-body">

										<p>Would you like to continue with some arbitrary task?</p>

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Cancel</button>

										<button type="button" data-dismiss="modal" class="btn green">Continue Task</button>

									</div>

								</div>

								<div id="full-width" class="modal container hide fade" tabindex="-1">

									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

										<h3>Full Width</h3>

									</div>

									<div class="modal-body">

										<p>This modal will resize itself to the same dimensions as the container class.</p>

										<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis sollicitudin ipsum ac ante fermentum suscipit. In ac augue non purus accumsan lobortis id sed nibh. Nunc egestas hendrerit ipsum, et porttitor augue volutpat non. Aliquam erat volutpat. Vestibulum scelerisque lobortis pulvinar. Aenean hendrerit risus neque, eget tincidunt leo. Vestibulum est tortor, commodo nec cursus nec, vestibulum vel nibh. Morbi elit magna, ornare placerat euismod semper, dignissim vel odio. Phasellus elementum quam eu ipsum euismod pretium.</p>

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Close</button>

										<button type="button" class="btn green">Save changes</button>

									</div>

								</div>

								<div id="long" class="modal hide fade" tabindex="-1" data-replace="true">

									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

										<h3>A Fairly Long Modal</h3>

									</div>

									<div class="modal-body">

										<a class="btn red" data-toggle="modal" href="#notlong" alt="" style="position: absolute; top: 50%; right: 12px">Not So Long Modal</a>

										<img style="height: 800px" src="media/image/KwPYo.jpg">

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Close</button>

									</div>

								</div>

								<div id="notlong" class="modal hide fade" tabindex="-1" data-replace="true">

									<div class="modal-header">

										<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>

										<h3>Not Long Modal</h3>

									</div>

									<div class="modal-body">

										<a class="btn red" data-toggle="modal" href="#long" style="position: absolute; top: 50%; right: 12px">Long Modal</a>

										<img style="height: 300px" src="media/image/KwPYo.jpg" alt="">

									</div>

									<div class="modal-footer">

										<button type="button" data-dismiss="modal" class="btn">Close</button>

									</div>

								</div>

								<div id="ajax-modal" class="modal hide fade" tabindex="-1"></div>

							</div>

						</div>

						<!-- END PORTLET-->

					</div>

				</div>

				<!-- END PAGE CONTENT-->
<?php
$js_include[] = '<script src="/js/bootstrap-modal.js" type="text/javascript" ></script>';
$js_include[] = '<script src="/js/bootstrap-modalmanager.js" type="text/javascript" ></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>

<script>

</script>