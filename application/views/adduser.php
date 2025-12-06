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

                                <div class="caption"><i class="icon-reorder"></i>添加用户信息</div>

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

                                <form action="/index.php?c=user&m=insert" method="POST" id="form_sample_2" class="form-horizontal"  enctype="multipart/form-data">

                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">用户名<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="username" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">邮箱前缀<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="lejumail" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">员工编号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="sno" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">员工全称<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="fullname" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">城市<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="city" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">组织机构编号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="dept" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">组织机构名称<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="depart_name" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">左范围<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="lft" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">右范围<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="rgt" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">周报类型<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="wtype" value="1"/>个人
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="wtype" value="2"/>部门
                                            </label>
                                            <div id="form_2_wtype_error"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">座机电话<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="tel" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">手机号码<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="mobile" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">职务<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="ctype" value="1"/>员工
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="ctype" value="2"/>主管
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="ctype" value="3"/>经理
                                            </label>
                                            <div id="form_2_ctype_error"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">位置<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="position" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">状态<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="status" value="1"/>显示
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="status" value="2"/>隐藏
                                            </label>
                                            <div id="form_2_status_error"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
										<label class="control-label">生日</label>
										<div class="controls">
											<div class="input-append date form_meridian_datetime" data-date="2015-09-02T15:25:00Z">
												<input size="16" type="text" value="" readonly class="m-wrap" name="birthday">
												<span class="add-on"><i class="icon-remove"></i></span>
												<span class="add-on"><i class="icon-calendar"></i></span>
											</div>
											<div id="form_2_birthday_error"></div>
										</div>
									</div>
									
<!-- 									<div class="control-group"> -->
<!-- 										<label class="control-label">入职时间</label> -->
<!-- 										<div class="controls"> -->
<!-- 											<div class="input-append date form_meridian_datetime" data-date="2015-09-02T15:25:00Z"> -->
<!-- 												<input size="16" type="text" value="" readonly class="m-wrap" name="entrytime"> -->
<!-- 												<span class="add-on"><i class="icon-remove"></i></span> -->
<!-- 												<span class="add-on"><i class="icon-calendar"></i></span> -->
<!-- 											</div> -->
<!-- 											<div id="form_2_entrytime_error"></div> -->
<!-- 										</div> -->
<!-- 									</div> -->
									
									<div class="control-group">
                                        <label class="control-label">工作信息<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="work_position" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">工作地点<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="city_true" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">邮箱地址<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="mailname" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">角色<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="role_id" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">微博地址<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="weibo" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group quanxian" style="display:none">
                                        <label class="control-label">发通知权限<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="is_notify" value="1"/>有权限
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="is_notify" value="2"/>无权限
                                            </label>
                                            <div id="form_2_is_notify_error"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">是否存在<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="is_exists" value="1"/>存在
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="is_exists" value="2"/>不存在
                                            </label>
                                            <div id="form_2_is_exists_error"></div>
                                        </div>
                                    </div>
									
									<div class="control-group">
                                        <label class="control-label">后台权限<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="is_ok" value="1"/>有权限
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="is_ok" value="2"/>无权限
                                            </label>
                                            <div id="form_2_is_ok_error"></div>
                                        </div>
                                    </div>
									
                                    <div class="control-group">
                                        <label class="control-label">微米号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="wmh" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">图片<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="file" name="pic_path" data-required="1" class="span6 m-wrap"/>
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
$js_include[] = '<script type="text/javascript" src="/js/webadmin/adduser.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>