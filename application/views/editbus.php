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

                                <div class="caption"><i class="icon-reorder"></i>修改班车线路信息</div>

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

                                <form action="/index.php?c=bus&m=update" method="POST" id="form_sample_2" class="form-horizontal">
									<input type="hidden" name="id" value="<?php echo $bus['lineid']; ?>">
									<input type="hidden" name="oldlinename" id="oldlinename" value="<?php echo $bus['linename']; ?>">
                                    <div class="alert alert-error hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你有某种形式的错误。请检查。
                                    </div>

                                    <div class="alert alert-success hide">
                                        <button class="close" data-dismiss="alert"></button>
                                        你的表单验证成功!
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label">线路名称<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="linename" id="newlinename" value="<?php echo $bus['linename']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
									
									<div class="control-group">
                                        <label class="control-label">班车编号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="sno" value="<?php echo $bus['sno']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">班车线路<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="line" value="<?php echo $bus['line']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">早晚发车时间<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="linetime" value="<?php echo $bus['linetime']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">司机名称<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="driver" value="<?php echo $bus['driver']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">司机手机号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="dmobile" value="<?php echo $bus['dmobile']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">车牌号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="busnumber" value="<?php echo $bus['busnumber']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">班车长<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="teamer" value="<?php echo $bus['teamer']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">班车长手机号<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="tmobile" value="<?php echo $bus['tmobile']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">班车长邮箱<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="temail" value="<?php echo $bus['temail']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    <!--<div class="controls">
                                    	<span style="margin-left:10px;">上车站点</span><span style="margin-left:40px;">发车时间</span><span style="margin-left:90px;">停车位置</span>
                                    	<div id="form_2_station_error" style="margin-left:10px;"></div><div id="form_2_time_error" style="margin-left:40px;"></div><div id="form_2_address_error" style="margin-left:90px;"></div>
                                    </div>-->
                                    <button style="margin-left:10px;margin-bottom:-50px;" id="addfield" >点击添加</button>
                                    <div class="control-group" id="reference">
                                    	<?php
											foreach ($station as $data){
										?>
                                        <label class="control-label">早班站点<span class="required">*</span></label>
                                        <div class="controls">
                                        	<input type="hidden" name="stationid[]" value="<?php echo $data['stationid']; ?>">
                                            <input type="text" class="span6 m-wrap" style="width:80px;height:20px;" name="get_station[]" value="<?php echo $data['get_station']; ?>" onFocus="if(value=='上车站点'){value='';}" value="上车站点" data-required="1"/>&nbsp;
                                            <input type="text" class="span6 m-wrap" style="width:80px;height:20px;" name="send_time[]" value="<?php echo $data['send_time']; ?>" onFocus="if(value=='发车时间'){value='';}" value="发车时间" data-required="1"/>&nbsp;
                                            <input type="text" class="span6 m-wrap" style="width:210px;height:20px;" name="stop_address[]" value="<?php echo $data['stop_address']; ?>" onFocus="if(value=='停车位置'){value='';}" value="停车位置" data-required="1"/>
                                        </div><br/>
                                        <?php }?>
                                    </div>
									
									<div class="control-group">
                                        <label class="control-label">晚班始发站点<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="nightstart" value="<?php echo $bus['nightstart']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">晚班发车时间<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="nighttime" value="<?php echo $bus['nighttime']; ?>" data-required="1" class="span6 m-wrap"/>
                                        </div>
                                    </div>
                                    
                                    <div class="control-group">
                                        <label class="control-label">晚班停车位置<span class="required">*</span></label>
                                        <div class="controls">
                                            <input type="text" name="nightadd" value="<?php echo $bus['nightadd']; ?>" data-required="1" class="span6 m-wrap"/>
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
$js_include[] = '<script type="text/javascript" src="/js/webadmin/editbus.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>
<script type="text/javascript">
$(document).ready(function(){
  $("#addfield").click(function(){
  	var reference = $("#reference");
  	var option = $("<div class=\"waitdel\"><label class=\"control-label\">早班站点<span class=\"required\">*</span></label><div class=\"controls\"><input type=\"text\" class=\"span6 m-wrap\" style=\"width:80px;height:20px;\" onFocus=\"if(value=='上车站点'){value='';}\" value=\"上车站点\" name=\"get_station[]\" data-required=\"1\"/>&nbsp;&nbsp;<input type=\"text\" style=\"width:80px;height:20px;\" class=\"span6 m-wrap\" onFocus=\"if(value=='发车时间'){value='';}\" value=\"发车时间\" name=\"send_time[]\" data-required=\"1\"/>&nbsp;&nbsp;<input type=\"text\" style=\"width:210px;height:20px;\" class=\"span6 m-wrap\" onFocus=\"if(value=='停车位置'){value='';}\" value=\"停车位置\" name=\"stop_address[]\" data-required=\"1\"/>&nbsp;<button class=\"dodel\">删除</button></div><br/></div>").appendTo(reference);
  	$(".dodel").click(function(){
  		$(this).parent().parent('.waitdel').remove();
  	});
  	return false;
  });
});
</script>
</script>