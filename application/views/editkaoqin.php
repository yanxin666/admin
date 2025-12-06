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

                                <div class="caption"><i class="icon-reorder"></i>修改考勤信息</div>

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

                                <form action="/index.php?c=kaoqin&m=update" method="POST" id="form_sample_2" class="form-horizontal">
                                    <input type = "hidden" name = "id" value = "<?php echo is_numeric($kaoqin_data["id"]) ? intval($kaoqin_data["id"]) : ""; ?>"/>
                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

                                    <div class="control-group">
										<label class="control-label">打卡人:<span class="required">*</span></label>
												<div class="controls chzn-controls">
													<select id="form_2_chosen" class="span6 chosen" data-with-diselect="1" name="lejuid" data-placeholder="选择打卡人" tabindex="1">
														<option value=""></option>
														<?php
															foreach ($user as $data){
														?>
														<option value="<?php echo $data['id']?>" <?php if($data['id'] == $kaoqin_data["lejuid"]) echo "selected"; ?>><?php echo $data['fullname']?></option>
														<?php }?>
													</select>
												</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">打卡时间:</label>
										<div class="controls">
											<div class="input-append date form_meridian_datetime" data-date="2015-09-02T15:25:00Z">
												<input size="16" type="text" value="<?php echo $kaoqin_data['kqtime']?>" readonly class="m-wrap" name="kqtime">
												<span class="add-on"><i class="icon-remove"></i></span>
												<span class="add-on"><i class="icon-calendar"></i></span>
											</div>
											<div id="form_2_kqtime_error"></div>
										</div>
									</div>

<!--                                     <div class="control-group"> -->
<!--                                         <label class="control-label">打卡经度<span class="required">*</span></label> -->
<!--                                         <div class="controls"> -->
<!--                                             <input type="text" name="latitude" data-required="1" class="span6 m-wrap" value = "<php echo trim($kaoqin_data["latitude"]) ? trim($kaoqin_data["latitude"]) : ""; ?>"/> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                    <div class="control-group"> -->
<!--                                         <label class="control-label">打卡纬度<span class="required">*</span></label> -->
<!--                                         <div class="controls"> -->
<!--                                             <input type="text" name="longtitude" data-required="1" class="span6 m-wrap" value = "<php echo trim($kaoqin_data["longtitude"]) ? trim($kaoqin_data["longtitude"]) : ""; ?>"/> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    
                                    <div class="control-group">
                                        <label class="control-label">打卡地址<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="address" data-required="1" class="span6 m-wrap" value = "<?php echo trim($kaoqin_data["address"]) ? trim($kaoqin_data["address"]) : ""; ?>"/>
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
$js_include[] = '<script type="text/javascript" src="/js/bootstrap-datetimepicker.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/webadmin/editkaoqin.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>