<?php
$css_include[] = '<link href="/css/select2_metro.css" rel="stylesheet" type="text/css" />';
$css_include[] = '<link href="/css/chosen.css" rel="stylesheet" type="text/css" />';
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/colorpicker.css" />';
?>

<?php include VIEWPATH . 'header.php' ?>
<!--<style>
	.ueditor > script{
	width:960px;
	height:550px;
	}
</style>-->
                <!-- BEGIN PAGE CONTENT-->
                <div class="row-fluid">

                    <div class="span12">

                        <!-- BEGIN VALIDATION STATES-->

                        <div class="portlet box green">

                            <div class="portlet-title">

                                <div class="caption"><i class="icon-reorder"></i>添加问候语信息</div>

                                <div class="tools">

                                    <a href="javascript:;" class="collapse"></a>

                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>

                                    <a href="javascript:;" class="reload"></a>

                                    <a href="javascript:;" class="remove"></a>

                                </div>

                            </div>

                            <div class="portlet-body form">

                                <!-- BEGIN FORM-->

                                <!-- <h3>预先验证的自定义单选按钮、复选框和选择插入</h3> -->

                                <form action="/index.php?c=greetings&m=insert" method="POST" id="form_sample_2" class="form-horizontal" enctype="multipart/form-data">

                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

									<div class="control-group">
                                        <label class="control-label">问候语<span class="required">*</span></label>
                                        <div class="controls">
                                            <textarea name="content" data-required="1" class="span6 m-wrap"/></textarea>
                                        </div>
                                    </div>
									
									<div class="control-group">
										<label class="control-label">字体颜色</label>
										<div class="controls">
											<div class="input-append color colorpicker-yanxin" data-color="#d62f6b">
												<input type="text" name="color" class="m-wrap" value="#d62f6b" readonly />
												<span class="add-on"><i style="background-color: #d62f6b;"></i></span>
											</div>
											<div id="form_2_color_error"></div>
										</div>
									</div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">背景图片<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="file" name="img" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
									
                                    <div class="form-actions">
                                        <button type="submit" class="btn green">添加</button>
                                        <button type="reset" class="btn" id="reset">重置</button>
                                    </div>
                                </form>
                                <!-- END FORM-->

                            </div>

                        </div>

                        <!-- END VALIDATION STATES-->

                    </div>

                </div>

                <!-- END PAGE CONTENT-->


<?php
$js_include[] = '<script type="text/javascript" src="/js/jquery.validate.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/additional-methods.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/select2.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/chosen.jquery.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/bootstrap-datetimepicker.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/bootstrap-colorpicker.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/webadmin/addgreetings.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>