<?php
$css_include[] = '<link href="/css/select2_metro.css" rel="stylesheet" type="text/css" />';
$css_include[] = '<link href="/css/chosen.css" rel="stylesheet" type="text/css" />';
$css_include[] = '<link href="/css/datetimepicker.css" rel="stylesheet" type="text/css" />';
?>

<?php include VIEWPATH . 'header.php' ?>

                <!-- BEGIN PAGE CONTENT-->
                <div class="row-fluid">

                    <div class="span12">

                        <!-- BEGIN VALIDATION STATES-->

                        <div class="portlet box green">

                            <div class="portlet-title">

                                <div class="caption"><i class="icon-reorder"></i>添加报销信息</div>

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

                                <form action="/index.php?c=expense&m=insert" method="POST" id="form_sample_2" class="form-horizontal">

                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">报销单号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="expense_code" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">申请人工号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="gz_no" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
										<label class="control-label">申请人:<span class="required">*</span></label>
												<div class="controls chzn-controls">
													<select id="form_2_chosen" class="span6 chosen" data-with-diselect="1" name="author_user" data-placeholder="选择申请人" tabindex="1">
														<option value=""></option>
														<?php
															foreach ($user as $data){
														?>
														<option value="<?php echo $data['id']?>"><?php echo $data['fullname']?></option>
														<?php }?>
													</select>
												</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">所属部门:<span class="required">*</span></label>
												<div class="controls chzn-controls">
													<select id="form_3_chosen" class="span6 chosen" data-with-diselect="1" name="author_dept" data-placeholder="选择部门" tabindex="1">
														<option value=""></option>
														<?php
															foreach ($org as $data){
														?>
														<option value="<?php echo $data['id']?>"><?php echo $data['depart_name']?></option>
														<?php }?>
													</select>
												</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">起草时间:</label>
										<div class="controls">
											<div class="input-append date form_meridian_datetime" data-date="2015-09-02T15:25:00Z">
												<input size="16" type="text" value="" readonly class="m-wrap" name="draft_time">
												<span class="add-on"><i class="icon-remove"></i></span>
												<span class="add-on"><i class="icon-calendar"></i></span>
											</div>
											<div id="form_2_time_error"></div>
										</div>
									</div>

                                    <div class="control-group">
                                        <label class="control-label">报销金额<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="total_expense" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">当前节点人<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="had_act_user" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
										<label class="control-label">预算年份:<span class="required">*</span></label>
												<div class="controls chzn-controls">
													<select id="form_4_chosen" class="span6 chosen" data-with-diselect="1" name="budget_year" data-placeholder="选择年份" tabindex="1">
														<option value=""></option>
														<?php
															for($i=2000;$i<3000;$i++){
														?>
														<option value="<?php echo $i; ?>"><?php echo $i;?></option>
														<?php }?>
													</select>
												</div>
									</div>
                                    
                                    <div class="control-group">
										<label class="control-label">预算月份:<span class="required">*</span></label>
												<div class="controls chzn-controls">
													<select id="form_5_chosen" class="span6 chosen" data-with-diselect="1" name="budget_month" data-placeholder="选择月份" tabindex="1">
														<option value=""></option>
														<?php
															for($i=1;$i<13;$i++){
														?>
														<option value="<?php echo $i; ?>"><?php echo $i;?></option>
														<?php }?>
													</select>
												</div>
									</div><br/>
									
                                    <div class="control-group">
                                        <label class="control-label">审批状态:<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="activityos" value="1"/>待审批
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="activityos" value="2" />已审批
                                            </label>
                                            <div id="form_2_activityos_error"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">是否领款:<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="islk" value="1"/>未领取
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="islk" value="2" />已领取
                                            </label>
                                            <div id="form_2_islk_error"></div>
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
$js_include[] = '<script type="text/javascript" src="/js/webadmin/addexpense.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>