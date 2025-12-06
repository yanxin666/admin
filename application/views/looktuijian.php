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

                                <div class="caption"><i class="icon-reorder"></i>查看推荐详情</div>

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

                                <form action="/index.php?c=process&m=insert" method="POST" id="form_sample_2" class="form-horizontal">

                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">姓名<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="name" value="<?php echo $tuijian['name']; ?>" readonly data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">性别<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="sex" value="<?php echo $tuijian['sex']; ?>" readonly data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">邮箱<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="femail" value="<?php echo $tuijian['femail']; ?>" readonly data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">手机<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="fmobile" value="<?php echo $tuijian['fmobile']; ?>" readonly data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">学历<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="feducation" value="<?php echo $tuijian['feducation']; ?>" readonly data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">工作经验<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="workhistory" value="<?php echo $tuijian['workhistory']; ?>" readonly data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
									
									<div class="control-group">
                                        <label class="control-label">工作内容<span class="required">*</span></label>
                                        <div class="controls">
                                            <textarea name="content" data-required="1" readonly class="span6 m-wrap"/><?php echo $tuijian['content']; ?></textarea>
                                        </div>
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
?>
<?php include VIEWPATH . 'footer.php' ?>