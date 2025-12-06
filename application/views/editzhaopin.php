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

                                <div class="caption"><i class="icon-reorder"></i>修改招聘职位信息</div>

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

                                <form action="/index.php?c=zhaopin&m=update" method="POST" id="form_sample_2" class="form-horizontal">
									<input type="hidden" name="id" value="<?php echo $zhaopin['id']; ?>"/>
									<input type="hidden" name="oldposition" id="oldposition" value="<?php echo $zhaopin['position']; ?>"/>
                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">职位名称<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="position" id="newposition" value="<?php echo $zhaopin['position']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">需求人数<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="num" value="<?php echo $zhaopin['num']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">工作地点<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="address" value="<?php echo $zhaopin['address']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
									
									<div class="control-group">
                                        <label class="control-label">工作年限<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="limittime" value="<?php echo $zhaopin['limittime']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
									
									<div class="control-group">
                                        <label class="control-label">学历<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="edu" value="<?php echo $zhaopin['edu']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">奖励金额<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="bonus" value="<?php echo $zhaopin['bonus']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
									
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label">发布时间</label> -->
<!-- 										<div class="controls"> -->
<!-- 											<div class="input-append date form_meridian_datetime" data-date="2015-09-02T15:25:00Z"> -->
<!-- 												<input size="16" type="text" value="<php echo $zhaopin['time']; ?>" readonly class="m-wrap" name="time"> -->
<!-- 												<span class="add-on"><i class="icon-remove"></i></span> -->
<!-- 												<span class="add-on"><i class="icon-calendar"></i></span> -->
<!-- 											</div> -->
<!-- 											<div id="form_2_time_error"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
                                    
                                    <div class="control-group quanxian">
                                        <label class="control-label">状态<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="status" value="1" <?php if($zhaopin['status'] == 1) echo "checked"; ?>/>显示
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="status" value="2" <?php if($zhaopin['status'] == 2) echo "checked"; ?>/>隐藏
                                            </label>
                                            <div id="form_2_status_error"></div>
                                        </div>
                                    </div>
									
									<div class="control-group">
                                        <label class="control-label">工作职责<span class="required">*</span></label>
                                        <div class="controls">
                                            <textarea name="jobduty" data-required="1" class="span6 m-wrap"><?php echo $zhaopin['jobduty']; ?></textarea>
                                        </div>
                                    </div>
                                    
									<div class="control-group">
                                        <label class="control-label">职位要求<span class="required">*</span></label>
                                        <div class="controls">
                                            <textarea name="jobneed" data-required="1" class="span6 m-wrap"><?php echo $zhaopin['jobneed']; ?></textarea>
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
// $js_include[] = '<script type="text/javascript" src="/js/bootstrap-datetimepicker.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/select2.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/chosen.jquery.min.js"></script>';

$js_include[] = '<script type="text/javascript" src="/js/webadmin/editzhaopin.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>