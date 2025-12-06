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

                                <div class="caption"><i class="icon-reorder"></i>修改联系组信息</div>

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

                                <form action="/index.php?c=team&m=update" method="POST" id="form_sample_2" class="form-horizontal">
									<input type="hidden" name="id" value="<?php echo $team_data['id']; ?>"/>
									<input type="hidden" name="oldname" id="oldname" value="<?php echo $team_data['team_name']; ?>"/>
                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">组名称<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="team_name" value="<?php echo $team_data['team_name']; ?>" id="newname" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>

<!--                                     <div class="control-group"> -->
<!--                                         <label class="control-label">组邮件地址<span class="required">*</span></label> -->
<!--                                         <div class="controls"> -->
<!--                                             <input type="text" name="team_mails" value="<php echo $team_data['team_mails']; ?>" data-required="1" class="span6 m-wrap"/> -->
<!--                                         </div> -->
<!--                                     </div> -->
                                    
                                    <div class="control-group">
										<label class="control-label">组创建人<span class="required">*</span></label>
												<div class="controls chzn-controls">
													<select id="form_2_chosen" class="span6 chosen" data-with-diselect="1" name="createrid" data-placeholder="选择组创建人" tabindex="1">
														<option value=""></option>
														<?php
															foreach ($users as $data){
														?>
														<option value="<?php echo $data['id']?>" <?php if($data['id'] == $team_data['createrid']) echo "selected"; ?>><?php echo $data['fullname']?></option>
														<?php }?>
													</select>
												</div>
									</div>
                                    
                                    <div class="control-group">
										<label class="control-label">选择部门:<span class="required">*</span></label>
										<div class="controls">
											<select data-placeholder="请选择部门" class="chosen span6" multiple="multiple" tabindex="6" name="dept[]">
												<option value=""></option>
												<optgroup label="部门名称">
													<?php
														foreach ($org as $data){
													?>
													<option value="<?php echo $data['old_exits_id']?>"><?php echo $data['depart_name']?></option>												
													<?php }?>
												</optgroup>
											</select>
										</div>
									</div>
									
									<div class="control-group">
										<label class="control-label">选择个人:<span class="required">*</span></label>
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
									</div><br/>
									
<!--                                     <div class="control-group"> -->
<!--                                         <label class="control-label">组类型<span class="required">*</span></label> -->
<!--                                         <div class="controls"> -->
<!--                                             <label class="radio line"> -->
<!--                                                 <input type="radio" name="type" value="1" <php if($team_data['type'] == 1) echo "checked" ?>/>默认组 -->
<!--                                             </label> -->
<!--                                             <label class="radio line"> -->
<!--                                                 <input type="radio" name="type" value="2" <php if($team_data['type'] == 2) echo "checked" ?>/>邮件组 -->
<!--                                             </label> -->
<!--                                             <label class="radio line"> -->
<!--                                                 <input type="radio" name="type" value="3" <php if($team_data['type'] == 3) echo "checked" ?>/>自定义组 -->
<!--                                             </label> -->
<!--                                             <div id="form_2_type_error"></div> -->
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

$js_include[] = '<script type="text/javascript" src="/js/webadmin/editteam.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>