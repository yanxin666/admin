<!doctype html>
<html><head>
<link rel="stylesheet" type="text/css" href="./css/login/base.css" />
<link rel="stylesheet" type="text/css" href="./css/login/contact.css" />
<link href="/css/select2_metro.css" rel="stylesheet" type="text/css" />
<link href="/css/chosen.css" rel="stylesheet" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta charset="utf-8">
<title>新浪乐居职位推荐</title>
<style>
</style>
</head>

<body>
<!--banner栏-->
<!--栏目-->
<div class="columnbox">
    <div class="column4">
        <h4>新浪乐居好友推荐职位简历填写</h4>
        <p>您的信任,是我们奋斗的目标</p>  
		<form method="post" id="form_sample_2" action="./index.php?c=resume&m=insert">
			<input type="hidden" name="userid" value="<?php echo $userid; ?>"/>
			<input type="hidden" name="position_id" value="<?php echo $position_id; ?>"/>
			<div class="alert alert-error hide">
                                        <div class="close" data-dismiss="alert"></div>
                                       
                                    </div>

                                    <div class="alert alert-success hide">
                                        <div class="close" data-dismiss="alert"></div>
                                        
                                    </div>
<!-- 			<div class="listbox"> -->
<!-- 				<div class="list_left"> -->
					<div align="center">	
						
						<div class="list1 control-group">
							<input type="text" name="name" value="" placeholder="&nbsp;&nbsp;姓名">
						</div>
						<div class="formcss" id="form_2_name_error"></div>
						
						<div class="list1 control-group">
							<input type="text" name="sex" value="" placeholder="&nbsp;&nbsp;性别">
						</div>
						<div class="formcss" id="form_2_sex_error"></div>
						
						<div class="list1 control-group">
							<input type="text" name="mobile" value="" placeholder="&nbsp;&nbsp;手机号">
						</div>
						<div class="formcss" id="form_2_mobile_error"></div>
						
						<div class="list1 control-group">
							<input type="text" name="email" value="" placeholder="&nbsp;&nbsp;Email">
						</div>
						<div class="formcss" id="form_2_email_error"></div>
						
<!-- 					</div> -->
<!-- 				<div class="list_right"> -->
						
						<div class="list1 control-group">
							<input type="text" name="edu" value="" placeholder="&nbsp;&nbsp;学历">
						</div>
						<div class="formcss" id="form_2_edu_error"></div>
						
						<div class="list1 control-group">
							<input type="text" name="workhistory" value="" placeholder="&nbsp;&nbsp;工作经验">
						</div>
						<div class="formcss" id="form_2_workhistory_error"></div>
						
						<div class="list1 control-group" style="height:175px">
							<textarea name="content" placeholder="&nbsp;工作内容"></textarea>
						</div>
						<div class="formcss" id="form_2_content_error"></div>
						                   
					</div>                
<!-- 			</div> -->
			<div class="btn_ture">
			   <a href="#"><input id="sub" type="submit" value="发送简历"></a>
			   
			</div>
		</form>
    </div>
</div>
<!--页脚-->
</body>
<script src="/js/jquery-1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/js/webadmin/addresume.js"></script>
</html>
