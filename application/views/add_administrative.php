<?php
$css_include[] = '<link href="/css/select2_metro.css" rel="stylesheet" type="text/css" />';
$css_include[] = '<link href="/css/chosen.css" rel="stylesheet" type="text/css" />';
?>

<?php include VIEWPATH . 'header.php' ?>

                <!-- BEGIN PAGE CONTENT-->
                <div class="row-fluid">

                    <div class="span12">

                        <!-- BEGIN VALIDATION STATES-->

                        <div class="portlet box green">

                            <div class="portlet-title">

                                <div class="caption"><i class="icon-reorder"></i>添加行政联系信息</div>

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

                                <form action="/index.php?c=administrative&m=insert" method="POST" id="form_sample_2" class="form-horizontal" enctype="multipart/form-data">

                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">序号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="number" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
										<label class="control-label">大区<span class="required">*</span></label>
										<div class="controls chzn-controls">
											<select id="form_2_chosen" class="span6 chosen" data-with-diselect="1" name="area" data-placeholder="选择大区" tabindex="1">
												<option value=""></option>
												<option value="1">北方区</option>
												<option value="2">华北区</option>
												<option value="3">东北区</option>
												<option value="4">华南区</option>
												<option value="5">浙闽区</option>
												<option value="6">苏南区</option>
												<option value="7">东部区</option>
												<option value="8">联合区</option>
												<option value="9">单列市</option>
											</select>
										</div>
									</div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">城市<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="city" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">职位<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="position" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">姓名<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="name" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">邮箱<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="zjlemail" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">行政联系人<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="linkman" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">座机<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="tel" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">IP电话<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="ipphone" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">手机<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="mobile" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">行政邮箱<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="xzemail" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">公司地址<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="address" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">邮编<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="code" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">备注<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="note" data-required="1" class="span6 m-wrap"/>
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
$js_include[] = '<script type="text/javascript" src="/js/webadmin/add_administrative.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>