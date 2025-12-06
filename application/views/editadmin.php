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

                                <div class="caption"><i class="icon-reorder"></i>修改管理员信息</div>

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

                                <form action="/index.php?c=admin&m=update" method="POST" id="form_sample_2" class="form-horizontal">
                                    <input type = "hidden" name = "id" value = "<?php echo is_numeric($admin_data["id"]) ? intval($admin_data["id"]) : ""; ?>"/>
                                    <input type = "hidden" name = "oldemail" value = "<?php echo trim($admin_data["email"]) ? trim($admin_data["email"]) : ""; ?>" id="oldemail"/>
                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">管理员邮箱<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="email" data-required="1" class="span6 m-wrap" value = "<?php echo trim($admin_data["email"]) ? trim($admin_data["email"]) : ""; ?>" id="email"/>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">所属部门<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="department" data-required="1" class="span6 m-wrap" value = "<?php echo trim($admin_data["department"]) ? trim($admin_data["department"]) : ""; ?>"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group quanxian">
                                        <label class="control-label">发通知权限<span class="required">*</span></label>
                                        <div class="controls">
                                            <label class="radio line">
                                                <input type="radio" name="is_notify" value="1" <?php if($admin_data["is_notify"] == 1) echo "checked"; ?>/>有权限
                                            </label>
                                            <label class="radio line">
                                                <input type="radio" name="is_notify" value="2" <?php if($admin_data["is_notify"] == 2) echo "checked"; ?>/>无权限
                                            </label>
                                            <div id="form_2_is_notify_error"></div>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label"><a href="index.php?c=admin&m=editpass&id=<?php echo is_numeric($admin_data["id"]) ? intval($admin_data["id"]) : ""; ?>">如需修改密码,请点击!</a></label>
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

$js_include[] = '<script type="text/javascript" src="/js/webadmin/editadmin.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>