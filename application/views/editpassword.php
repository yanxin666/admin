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

                                <div class="caption"><i class="icon-reorder"></i>修改薪酬密码</div>

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

                                <form action="/index.php?c=payment&m=updatepass" method="POST" id="form_sample_2" class="form-horizontal">
                                     <input type = "hidden" name = "id" value = "<?php echo is_numeric($payment_data["id"]) ? intval($payment_data["id"]) : ""; ?>"/>
                                    <input type = "hidden" name = "oldpass" value = "<?php echo trim($payment_data["password"]) ? trim($payment_data["password"]) : ""; ?>" id="oldpass"/>
                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">原始密码<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="password" name="reoldpass" data-required="1" class="span6 m-wrap" value = "" id="reoldpass"/>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">新密码<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="password" name="newpass" data-required="1" class="span6 m-wrap" value = "" id="newpass"/>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">再次输入新密码<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="password" name="renewpass" data-required="1" class="span6 m-wrap" value = "" id="renewpass"/>
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

$js_include[] = '<script type="text/javascript" src="/js/webadmin/editpass.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>