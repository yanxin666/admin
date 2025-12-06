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

                                <div class="caption"><i class="icon-reorder"></i>添加销售组员信息</div>

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

                                <form action="/index.php?c=sellman&m=insert" method="POST" id="form_sample_2" class="form-horizontal">

                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">组员id<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="user_id" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">组员名称<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="user_name" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">组员工号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="user_sn" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
									<div class="control-group">
										<label class="control-label">选择角色:<span class="required">*</span></label>
										<div class="controls chzn-controls">
											<select id="form_2_chosen" class="span6 chosen" data-with-diselect="1" name="role_id" data-placeholder="选择角色" tabindex="1">
												<option value=""></option>
												<?php
													foreach ($rolelist as $k=>$v){
												?>
												<option value="<?php echo $k ?>"><?php echo $v ?></option>
												<?php }?>
											</select>
										</div>
									</div>
									
									<div class="control-group">
                                        <label class="control-label">组织架构id<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="orgstr_id" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">组织架构树<span class="required">*</span></label>
                                        <div class="controls">
                                            <textarea name="orgstr_tree" data-required="1" class="span6 m-wrap"/></textarea>
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
$js_include[] = '<script type="text/javascript" src="/js/webadmin/addsellman.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>