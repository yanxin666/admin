<!DOCTYPE html>
<html>	
<head>
<title>新浪乐居项目 -- 系统登陆</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript">
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0); 
	}, false);
	function hideURLbar(){
		window.scrollTo(0,1);
	}
</script>
<meta name="keywords" content="系统登陆" />
<link href="/css/login/style.css" rel='stylesheet' type='text/css' />
<!--webfonts-->
<link href='/css/login/family_Open_Sans.css' rel='stylesheet' type='text/css'>
<link href='/css/login/family_Marvel.css' rel='stylesheet' type='text/css'>
<!--//webfonts-->
</head>
<body>
	<h1>新浪乐居项目系统登陆</h1>
		<div class="registration">
			<div class="form-info">
				<form id="sg_login-form" method="post" action="/index.php?c=loginpage&m=login">
					<h2>登陆</h2>
						<input type="text" class="text" name="user_name" placeholder="用户名" required="" />
						<input type="password" class="Password" name="password" placeholder="密码" required="" />
						<div class="btn"><input type="submit" value="Login" ></div>
							<div class="roundedOne">
								<input type="checkbox" value="None" id="roundedOne" name="check" />
									<label for="roundedOne">
										<p style="margin-top: 0px; margin-left: 7px;">记住我</p>
									</label>
							</div>
				</form>
						<div class="clear"> </div>
			</div>
						<div class="strip"><span>Welcome</span></div>
									
				</div>
			<div class="copy-rights">
		<p>技术服务 <a href="http://www.matouit.com" target="_blank">北京码投信息技术有限公司</a></p>
	</div>
</body>
</html>