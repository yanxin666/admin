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

                                <div class="caption"><i class="icon-reorder"></i>修改行政联系信息</div>

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

                                <form action="/index.php?c=administrative&m=update" method="POST" id="form_sample_2" class="form-horizontal" enctype="multipart/form-data">
									<input type="hidden" name="id" value="<?php echo $administrative['id']; ?>"/>
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
                                            <input type="text" name="number" value="<?php echo $administrative['number']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
										<label class="control-label">大区<span class="required">*</span></label>
										<div class="controls chzn-controls">
											<select id="form_2_chosen" class="span6 chosen" data-with-diselect="1" name="area" data-placeholder="选择大区" tabindex="1">
												<option value=""></option>
												<option value="1" <?php if($administrative['area'] == 1) echo "selected"; ?>>北方区</option>
												<option value="2" <?php if($administrative['area'] == 2) echo "selected"; ?>>华北区</option>
												<option value="3" <?php if($administrative['area'] == 3) echo "selected"; ?>>东北区</option>
												<option value="4" <?php if($administrative['area'] == 4) echo "selected"; ?>>华南区</option>
												<option value="5" <?php if($administrative['area'] == 5) echo "selected"; ?>>浙闽区</option>
												<option value="6" <?php if($administrative['area'] == 6) echo "selected"; ?>>苏南区</option>
												<option value="7" <?php if($administrative['area'] == 7) echo "selected"; ?>>东部区</option>
												<option value="8" <?php if($administrative['area'] == 8) echo "selected"; ?>>联合区</option>
												<option value="9" <?php if($administrative['area'] == 9) echo "selected"; ?>>单列市</option>
											</select>
										</div>
									</div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">城市<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="city" value="<?php echo $administrative['city']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">职位<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="position" value="<?php echo $administrative['position']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">姓名<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="name" value="<?php echo $administrative['name']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">邮箱<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="zjlemail" value="<?php echo $administrative['zjlemail']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">行政联系人<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="linkman" value="<?php echo $administrative['linkman']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">座机<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="tel" value="<?php echo $administrative['tel']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">IP电话<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="ipphone" value="<?php echo $administrative['ipphone']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">手机<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="mobile" value="<?php echo $administrative['mobile']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">行政邮箱<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="xzemail" value="<?php echo $administrative['xzemail']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">公司地址<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="address" value="<?php echo $administrative['address']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">邮编<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="code" value="<?php echo $administrative['code']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">备注<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="note" value="<?php echo $administrative['note']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-actions">
                                        <button type="submit" class="btn green">修改</button>
                                        <button type="reset" class="btn" id="reset">取消</button>
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
$js_include[] = '<script type="text/javascript" src="/js/webadmin/edit_administrative.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>