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

                                <div class="caption"><i class="icon-reorder"></i>修改人事通知信息</div>

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

                                <form action="/index.php?c=rsnotify&m=update" method="POST" id="form_sample_2" class="form-horizontal" enctype="multipart/form-data">
									<input type="hidden" name="id" value="<?php echo $notify['id']; ?>"/>
                                    <input type="hidden" name="oldimg" value="<?php echo $notify['img']; ?>"/>
                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

<!--                                     <div class="control-group"> -->
<!--                                         <label class="control-label">收邮件地址<span class="required">*</span></label> -->
<!--                                         <div class="controls"> -->
<!--                                             <input type="text" name="target_address" value="<php echo $notify['target_address']; ?>" data-required="1" class="span6 m-wrap"/> -->
<!--                                         </div> -->
<!--                                     </div> -->

<!--                                     <div class="control-group"> -->
<!--                                         <label class="control-label">发邮件地址<span class="required">*</span></label> -->
<!--                                         <div class="controls"> -->
<!--                                             <input type="text" name="sender_address" value="<php echo $notify['sender_address']; ?>" data-required="1" class="span6 m-wrap"/> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    
                                    <div class="control-group">
										<label class="control-label">发通知人:<span class="required">*</span></label>
												<div class="controls chzn-controls">
													<select id="form_2_chosen" class="span6 chosen" data-with-diselect="1" name="sender_id" data-placeholder="选择发通知人" tabindex="1">
														<option value=""></option>
														<?php
															foreach ($users as $data){
														?>
														<option value="<?php echo $data['id']?>" <?php if($data['id'] == $notify['sender_id']) echo "selected"; ?>><?php echo $data['fullname']?></option>
														<?php }?>
													</select>
												</div>
									</div>
									
									<div class="control-group">
                                        <label class="control-label">通知对象类型:<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="notify_type" value="1" checked onclick="choosetype('some')"/>部分员工
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="notify_type" value="2" onclick="choosetype('all')"/>全体员工
                                            </label>
                                            <div id="form_2_notify_type_error"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group" id="some1">
										<label class="control-label">通知联系组:<span class="required">*</span></label>
										<div class="controls">
											<select data-placeholder="请选择联系组" class="chosen span6" multiple="multiple" tabindex="6" name="team[]">
												<option value=""></option>
												<optgroup label="联系组名称">
													<?php
														foreach ($team as $data){
													?>
													<option value="<?php echo $data['team_man'].'@'.$data['listid']; ?>"><?php echo $data['team_name']?></option>												
													<?php }?>
												</optgroup>
											</select>
										</div>
									</div>
									
									<div class="control-group" id="some2">
										<label class="control-label">通知个人:<span class="required">*</span></label>
										<div class="controls">
											<select data-placeholder="请选择个人" class="chosen span6" multiple="multiple" tabindex="6" name="user[]">
												<option value=""></option>
												<optgroup label="名称">
													<?php
														foreach ($user as $data){
													?>
													<option value="<?php echo $data['lejumail'].'@'.$data['id']; ?>"><?php echo $data['fullname']?></option>												
													<?php }?>
												</optgroup>
											</select>
										</div>
									</div>

                                    <div class="control-group">
                                        <label class="control-label">通知标题<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="title" value="<?php echo $notify['title']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                     <div class="control-group">
                                        <label class="control-label">通知内容<span class="required">*</span></label>
                                        <div class="controls">
                                            <textarea name="content" data-required="1" class="span6 m-wrap"><?php echo $notify['content']; ?></textarea>
                                        </div>
                                    </div>
                                    
                                    <!--<div class="control-group">
										<label class="control-label">通知时间:</label>
										<div class="controls">
											<div class="input-append date form_meridian_datetime" data-date="2015-09-02T15:25:00Z">
												<input size="16" type="text"  value="<?php echo $notify['time']; ?>" readonly class="m-wrap" name="time">
												<span class="add-on"><i class="icon-remove"></i></span>
												<span class="add-on"><i class="icon-calendar"></i></span>
											</div>
											<div id="form_2_time_error"></div>
										</div>
									</div>-->
                                    
                                    <div class="control-group">
                                        <label class="control-label">图片<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="file" name="img" value="<?php echo $notify['img']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div><br/>
                                        <label class="control-label">原图浏览<span class="required">*</span></label>
                                        <div class="controls">
                                            <img src="<?php echo 'http://lejutong.leju.com/'.$notify['img']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
<!--                                     <div class="control-group"> -->
<!--                                         <label class="control-label">设备<span class="required">*</span></label> -->
<!--                                         <div class="controls"> -->
<!--                                             <input type="text" name="device" value="<php echo $notify['device']; ?>" data-required="1" class="span6 m-wrap"/> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    
<!--                                     <div class="control-group"> -->
<!--                                         <label class="control-label">发送状态:<span class="required">*</span></label> -->
<!--                                         <div class="controls"> -->
<!--                                             <label class="radio line"> -->
<!--                                                 <input type="radio" name="state" value="1" <php if($notify['state'] == 1) echo "checked"; ?>/>发送 -->
<!--                                             </label> -->
<!--                                             <label class="radio line"> -->
<!--                                                 <input type="radio" name="state" value="2" <php if($notify['state'] == 2) echo "checked"; ?>/>已发送 -->
<!--                                             </label> -->
<!--                                             <label class="radio line"> -->
<!--                                                 <input type="radio" name="state" value="3" <php if($notify['state'] == 3) echo "checked"; ?>/>已接收 -->
<!--                                             </label> -->
<!--                                             <div id="form_2_state_error"></div> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    
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
// $js_include[] = '<script type="text/javascript" src="/js/bootstrap-datetimepicker.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/webadmin/editrsnotify.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>