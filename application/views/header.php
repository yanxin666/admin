<!DOCTYPE html>

<!--[if IE 8]> <html lang="cn" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="cn" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="cn"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>新浪乐居系统后台 --  <?=$title?></title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="/css/blue.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<?php
	$css_include []= '';
	foreach($css_include as $css){
		echo $css,PHP_EOL;
	}
	?>
	
	<link rel="shortcut icon" href="/images/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed page-sidebar-fixed page-footer-fixed">

	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

<!-- 				<a class="brand" href="index.html"> -->

<!-- 				<img src="/images/logo.png" alt="logo" /> -->

<!-- 				</a> -->

				<!-- END LOGO -->

				<!-- BEGIN RESPONSIVE MENU TOGGLER -->

				<a href="javascript:;" class="btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">

				<img src="/images/menu-toggler.png" alt="" />

				</a>          

				<!-- END RESPONSIVE MENU TOGGLER -->            

				<!-- BEGIN TOP NAVIGATION MENU -->              

				<ul class="nav pull-right">

					<!-- BEGIN NOTIFICATION DROPDOWN -->   

					<li class="dropdown" id="header_notification_bar">

<!-- 						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->

<!-- 						<i class="icon-warning-sign"></i> -->

<!-- 						<span class="badge">14</span> -->

<!-- 						</a> -->

						<ul class="dropdown-menu extended notification">

							<!--<li><p>你有14条通知</p></li>

							<li>
								<a href="#">
									<span class="label label-success"><i class="icon-plus"></i></span>
									新用户注册
									<span class="time">刚刚</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="label label-important"><i class="icon-bolt"></i></span>
									Server #12 overloaded. 
									<span class="time">15 mins</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="label label-warning"><i class="icon-bell"></i></span>
									Server #2 not respoding.
									<span class="time">22 mins</span>
								</a>
							</li>
							
							<li>
								<a href="#">
									<span class="label label-info"><i class="icon-bullhorn"></i></span>
									应用错误.
									<span class="time">40 mins</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="label label-important"><i class="icon-bolt"></i></span>
									数据库过载 68%. 
									<span class="time">2 hrours</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="label label-important"><i class="icon-bolt"></i></span>
									2 用户 IP 阻塞.
									<span class="time">5 hrs</span>
								</a>
							</li>-->

							<li class="external">
								<a href="#">查看所有通知 <i class="m-icon-swapright"></i></a>
							</li>

						</ul>

					</li>

					<!-- END NOTIFICATION DROPDOWN -->

					<!-- BEGIN INBOX DROPDOWN -->

					<li class="dropdown" id="header_inbox_bar">

<!-- 						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->

<!-- 						<i class="icon-envelope"></i> -->

<!-- 						<span class="badge">12</span> -->

<!-- 						</a> -->

						<ul class="dropdown-menu extended inbox">

							<!--<li><p>你有12条新消息</p></li>

							<li>
								<a href="inbox.html?a=view">
									<span class="photo"><img src="/images/avatar2.jpg" alt="" /></span>
									<span class="subject">
										<span class="from">Lisa Wong</span>
										<span class="time">Just Now</span>
									</span>
									<span class="message">你好</span>  
								</a>
							</li>

							<li>
									<a href="inbox.html?a=view">
									<span class="photo"><img src="/images/avatar3.jpg" alt="" /></span>
									<span class="subject">
										<span class="from">Richard Doe</span>
										<span class="time">16 mins</span>
									</span>
									<span class="message">hello</span>  
								</a>
							</li>

							<li>
								<a href="inbox.html?a=view">
									<span class="photo"><img src="/images/avatar1.jpg" alt="" /></span>
									<span class="subject">
										<span class="from">Bob Nilson</span>
										<span class="time">2 hrous</span>
									</span>
									<span class="message">很高兴！！！</span>
								</a>
							</li>-->

							<li class="external">
								<a href="inbox.html">查看所有消息<i class="m-icon-swapright"></i></a>
							</li>

						</ul>

					</li>

					<!-- END INBOX DROPDOWN -->

					<!-- BEGIN TODO DROPDOWN -->

					<li class="dropdown" id="header_task_bar">

<!-- 						<a href="#" class="dropdown-toggle" data-toggle="dropdown"> -->

<!-- 						<i class="icon-tasks"></i> -->

<!-- 						<span class="badge">12</span> -->

<!-- 						</a> -->

						<ul class="dropdown-menu extended tasks">

							<!--<li><p>你有12个等待任务</p>	</li>

							<li>
								<a href="#">
									<span class="task">
										<span class="desc">新版本 v1.2</span>
										<span class="percent">30%</span>
									</span>
									<span class="progress progress-success ">
										<span style="width: 30%;" class="bar"></span>
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="task">
										<span class="desc">应用开发</span>
										<span class="percent">65%</span>
									</span>
									<span class="progress progress-danger progress-striped active">
										<span style="width: 65%;" class="bar"></span>
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="task">
										<span class="desc">手机应用程序发布</span>
										<span class="percent">98%</span>
									</span>
									<span class="progress progress-success">
										<span style="width: 98%;" class="bar"></span>
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="task">
										<span class="desc">数据库迁移</span>
										<span class="percent">10%</span>
									</span>
									<span class="progress progress-warning progress-striped">
										<span style="width: 10%;" class="bar"></span>
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="task">
										<span class="desc">Web服务器升级</span>
										<span class="percent">58%</span>
									</span>
									<span class="progress progress-info">
										<span style="width: 58%;" class="bar"></span>
									</span>
								</a>
							</li>

							<li>
								<a href="#">
									<span class="task">
										<span class="desc">移动开发</span>
										<span class="percent">85%</span>
									</span>
									<span class="progress progress-success">
										<span style="width: 85%;" class="bar"></span>
									</span>
								</a>
							</li>-->

							<li class="external">
								<a href="#">查看所有任务<i class="m-icon-swapright"></i></a>
							</li>

						</ul>

					</li>

					<!-- END TODO DROPDOWN -->

					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img alt="" src="/images/avatar1_small.jpg" />
							<span class="username"><?=$_SESSION['loginInfo']['loginname']?></span>
							<i class="icon-angle-down"></i>
						</a>

						<ul class="dropdown-menu">
<!-- 							<li><a href="#"><i class="icon-user"></i> 资料</a></li> -->
<!-- 							<li><a href="#"><i class="icon-calendar"></i>我的日程</a></li> -->
<!-- 							<li><a href="#"><i class="icon-envelope"></i>收件箱(3)</a></li> -->
<!-- 							<li><a href="#"><i class="icon-tasks"></i> 任务</a></li> -->
<!-- 							<li class="divider"></li> -->
<!-- 							<li><a href="#"><i class="icon-lock"></i>锁定屏幕</a></li> -->
							<li><a href="/index.php?c=loginpage&m=loginout"><i class="icon-key"></i>退出</a></li>
						</ul>
					</li>
					<!-- END USER LOGIN DROPDOWN -->
					
				</ul>
				<!-- END TOP NAVIGATION MENU --> 

			</div>

		</div>

		<!-- END TOP NAVIGATION BAR -->

	</div>

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->   

	<div class="page-container row-fluid">

		<!-- BEGIN SIDEBAR -->

		<div class="page-sidebar nav-collapse collapse">

			<!-- BEGIN SIDEBAR MENU -->        

			<ul class="page-sidebar-menu">

				<li>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

					<div class="sidebar-toggler hidden-phone"></div>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

				</li>

				<li>

					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->

<!-- 					<form class="sidebar-search"> -->

<!-- 						<div class="input-box"> -->

<!-- 							<a href="javascript:;" class="remove"></a> -->

<!-- 							<input type="text" placeholder="Search..." /> -->

<!-- 							<input type="button" class="submit" value=" " /> -->

<!-- 						</div> -->

<!-- 					</form> -->

					<!-- END RESPONSIVE QUICK SEARCH FORM -->

				</li>
				
				<!--<php if(in_array('admin', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0){ ?>
				<li class="start <php if($navshow == 'admin'){echo 'active';}?>">

					<a href="/index.php?c=admin">

					<i class="icon-home"></i> 

					<span class="title">管理员管理</span>
					
					<span class="selected"></span>

					</a>

				</li>
				<php }?>-->
				
				<li class="start <?php if($navshow == 'welcome'){echo 'active';}?>">

					<a href="/index.php?c=welcome">

					<!-- <i class="icon-road"></i>  -->

					<i class="icon-home"></i> 

					<span class="title">欢迎页</span>
					
					<span class="selected"></span>

					</a>

				</li>
				
				<?php if((in_array('user', $shownavlist) && (@in_array('用户管理',$_SESSION['loginInfo']['auth']))) || (in_array('user', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('user', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0){ ?> -->
				<li class="start <?php if($navshow == 'user'){echo 'active';}?>">

					<a href="/index.php?c=user">

					<!-- <i class="icon-road"></i>  -->

					<i class="icon-home"></i> 

					<span class="title">用户管理</span>
					
					<span class="selected"></span>

					</a>

				</li>
				<?php }?>
				
				
				<?php if((in_array('userauth', $shownavlist) && (@in_array('用户权限管理',$_SESSION['loginInfo']['auth']))) || (in_array('userauth', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
				<li class="start <?php if($navshow == 'userauth'){echo 'active';}?>">

					<a href="/index.php?c=userauth">

					<i class="icon-home"></i> 

					<span class="title">用户权限管理</span>
					
					<span class="selected"></span>

					</a>

				</li>
				<?php }?>
				
				<?php if((in_array('notify', $shownavlist) && $_SESSION['loginInfo']['is_notify'] == 1) || (in_array('notify', $shownavlist) && (@in_array('后台通知管理',$_SESSION['loginInfo']['auth']))) || (in_array('rsnotify', $shownavlist) && (@in_array('人事通知管理',$_SESSION['loginInfo']['auth']))) || (in_array('notify', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('rsnotify', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if((in_array('notify', $shownavlist) && $_SESSION['loginInfo']['is_notify'] == 1)){ ?> -->
				<li class=" start <?php if($navshow == 'notify' || $navshow == 'qtnotify' || $navshow == 'rsnotify'){echo 'active';}?>">
					<a href="javascript:;">
					<i class="icon-briefcase"></i> 
					<span class="title">通知管理</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<?php if((in_array('notify', $shownavlist) && $_SESSION['loginInfo']['is_notify'] == 1) || (in_array('notify', $shownavlist) && (@in_array('后台通知管理',$_SESSION['loginInfo']['auth']))) || (in_array('notify', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=notify">
							<i class="icon-cogs"></i>
							后台通知管理</a>
						</li>
						<?php }?>
<!-- 						<li > -->
<!-- 							<a href="/index.php?c=qtnotify"> -->
<!-- 							<i class="icon-cogs"></i> -->
<!-- 							前端通知管理</a> -->
<!-- 						</li> -->
						<?php if((in_array('rsnotify', $shownavlist) && (@in_array('人事通知管理',$_SESSION['loginInfo']['auth']))) || (in_array('rsnotify', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=rsnotify">
							<i class="icon-cogs"></i>
							人事通知管理</a>
						</li>
						<?php }?>
					</ul>
				</li>
				<?php }?>
				
				<?php if((in_array('slide', $shownavlist) && (@in_array('发布轮播图',$_SESSION['loginInfo']['auth']))) || (in_array('slide', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
				<li class="start <?php if($navshow == 'slide'){echo 'active';}?>">

					<a href="/index.php?c=slide">

					<i class="icon-home"></i> 

					<span class="title">轮播图管理</span>

					</a>

				</li>
				<?php }?>
				
				<?php if((in_array('greetings', $shownavlist) && (@in_array('问候语管理',$_SESSION['loginInfo']['auth']))) || (in_array('expense', $shownavlist) && (@in_array('报销管理',$_SESSION['loginInfo']['auth']))) || (in_array('bank', $shownavlist) && (@in_array('发卡行管理',$_SESSION['loginInfo']['auth']))) || (in_array('payment', $shownavlist) && (@in_array('薪酬密码管理',$_SESSION['loginInfo']['auth']))) || (in_array('process', $shownavlist) && (@in_array('办理流程管理',$_SESSION['loginInfo']['auth']))) || (in_array('greetings', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('expense', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('bank', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('payment', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('process', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('appmenu', $shownavlist)){ ?> -->
				<li class=" start <?php if($navshow == 'greetings' || $navshow == 'expense' || $navshow == 'bank' || $navshow == 'payment' || $navshow == 'process'){echo 'active';}?>">
					<a href="javascript:;">
					<i class="icon-briefcase"></i> 
					<span class="title">人事管理</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<?php if((in_array('greetings', $shownavlist) && (@in_array('问候语管理',$_SESSION['loginInfo']['auth']))) || (in_array('greetings', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=greetings">
							<i class="icon-cogs"></i>
							问候语管理</a>
						</li>
						<?php }?>
<!-- 						<php if((in_array('expense', $shownavlist) && (@in_array('报销管理',$_SESSION['loginInfo']['auth']))) || (in_array('expense', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?> -->
<!-- 						<li > -->
<!-- 							<a href="/index.php?c=expense"> -->
<!-- 							<i class="icon-cogs"></i> -->
<!-- 							报销管理</a> -->
<!-- 						</li> -->
<!-- 						<php }?> -->
						<?php if((in_array('bank', $shownavlist) && (@in_array('发卡行管理',$_SESSION['loginInfo']['auth']))) || (in_array('bank', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=bank">
							<i class="icon-cogs"></i>
							发卡行管理</a>
						</li>
						<?php }?>
<!-- 						<php if((in_array('payment', $shownavlist) && (@in_array('薪酬密码管理',$_SESSION['loginInfo']['auth']))) || (in_array('payment', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?> -->
<!-- 						<li > -->
<!-- 							<a href="/index.php?c=payment"> -->
<!-- 							<i class="icon-cogs"></i> -->
<!-- 							薪酬密码管理</a> -->
<!-- 						</li> -->
<!-- 						<php }?> -->
						<?php if((in_array('process', $shownavlist) && (@in_array('办理流程管理',$_SESSION['loginInfo']['auth']))) || (in_array('process', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=process">
							<i class="icon-cogs"></i>
							办理流程管理</a>
						</li>
						<?php }?>
					</ul>
				</li>
				<?php }?>
				
				<?php if((in_array('kaoqin', $shownavlist) && (@in_array('考勤管理',$_SESSION['loginInfo']['auth']))) || (in_array('kaoqin', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('kaoqin', $shownavlist)){ ?> -->
				<li class="start <?php if($navshow == 'kaoqin'){echo 'active';}?>">

					<a href="/index.php?c=kaoqin">

					<i class="icon-home"></i> 

					<span class="title">考勤管理</span>
					
					<span class="selected"></span>

					</a>

				</li>
				<?php }?>
				
				<?php if((in_array('zhaopin', $shownavlist) && (@in_array('招聘职位管理',$_SESSION['loginInfo']['auth']))) || (in_array('tuijian', $shownavlist) && (@in_array('推荐好友管理',$_SESSION['loginInfo']['auth']))) || (in_array('url', $shownavlist) && (@in_array('网址推荐管理',$_SESSION['loginInfo']['auth']))) || (in_array('administrative', $shownavlist) && (@in_array('行政联系管理',$_SESSION['loginInfo']['auth']))) || (in_array('bus', $shownavlist) && (@in_array('班车线路管理',$_SESSION['loginInfo']['auth']))) || (in_array('service', $shownavlist) && (@in_array('服务支持管理',$_SESSION['loginInfo']['auth']))) || (in_array('zhaopin', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('tuijian', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('url', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('administrative', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('bus', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('service', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('appmenu', $shownavlist)){ ?> -->
				<li class=" start <?php if($navshow == 'zhaopin' || $navshow == 'tuijian' || $navshow == 'url' || $navshow == 'administrative' || $navshow == 'bus' || $navshow == 'service'){echo 'active';}?>">
					<a href="javascript:;">
					<i class="icon-briefcase"></i> 
					<span class="title">行政管理</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<?php if((in_array('zhaopin', $shownavlist) && (@in_array('招聘职位管理',$_SESSION['loginInfo']['auth']))) || (in_array('zhaopin', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=zhaopin">
							<i class="icon-cogs"></i>
							招聘职位管理</a>
						</li>
						<?php }?>
						<?php if((in_array('tuijian', $shownavlist) && (@in_array('推荐好友管理',$_SESSION['loginInfo']['auth']))) || (in_array('tuijian', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=tuijian">
							<i class="icon-cogs"></i>
							推荐好友管理</a>
						</li>
						<?php }?>
						<?php if((in_array('url', $shownavlist) && (@in_array('网址推荐管理',$_SESSION['loginInfo']['auth']))) || (in_array('url', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=url">
							<i class="icon-cogs"></i>
							网址推荐管理</a>
						</li>
						<?php }?>
						<?php if((in_array('administrative', $shownavlist) && (@in_array('行政联系管理',$_SESSION['loginInfo']['auth']))) || (in_array('administrative', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=administrative">
							<i class="icon-cogs"></i>
							行政联系管理</a>
						</li>
						<?php }?>
						<?php if((in_array('bus', $shownavlist) && (@in_array('班车线路管理',$_SESSION['loginInfo']['auth']))) || (in_array('bus', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=bus">
							<i class="icon-cogs"></i>
							班车线路管理</a>
						</li>
						<?php }?>
						<?php if((in_array('service', $shownavlist) && (@in_array('服务支持管理',$_SESSION['loginInfo']['auth']))) || (in_array('service', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=service">
							<i class="icon-cogs"></i>
							服务支持管理</a>
						</li>
						<?php }?>
					</ul>
				</li>
				<?php }?>
				
				<?php if((in_array('appmenu', $shownavlist) && (@in_array('乐居菜单管理',$_SESSION['loginInfo']['auth']))) || (in_array('rsappmenu', $shownavlist) && (@in_array('人事菜单管理',$_SESSION['loginInfo']['auth']))) || (in_array('appmenu', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('rsappmenu', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('appmenu', $shownavlist)){ ?> -->
				<li class=" start <?php if($navshow == 'appmenu' || $navshow == 'rsappmenu'){echo 'active';}?>">
					<a href="javascript:;">
					<i class="icon-briefcase"></i> 
					<span class="title">APP菜单管理</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<?php if((in_array('appmenu', $shownavlist) && (@in_array('乐居菜单管理',$_SESSION['loginInfo']['auth']))) || (in_array('appmenu', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=appmenu">
							<i class="icon-cogs"></i>
							乐居菜单管理</a>
						</li>
						<?php }?>
						<?php if((in_array('rsappmenu', $shownavlist) && (@in_array('人事菜单管理',$_SESSION['loginInfo']['auth']))) || (in_array('rsappmenu', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=rsappmenu">
							<i class="icon-cogs"></i>
							人事菜单管理</a>
						</li>
						<?php }?>
					</ul>
				</li>
				<?php }?>
				
				<?php if((in_array('team', $shownavlist) && (@in_array('后台联系组管理',$_SESSION['loginInfo']['auth']))) || (in_array('team', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('expense', $shownavlist)){ ?> -->
				<li class="start <?php if($navshow == 'team'){echo 'active';}?>">

					<a href="/index.php?c=team">

					<i class="icon-home"></i> 

					<span class="title">联系组管理</span>
					
					<span class="selected"></span>

					</a>

				</li>
				<?php }?>
				
				<?php if((in_array('org', $shownavlist) && (@in_array('组织机构管理',$_SESSION['loginInfo']['auth']))) || (in_array('org', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('org', $shownavlist)){ ?> -->
				<li class="start <?php if($navshow == 'org'){echo 'active';}?>">

					<a href="/index.php?c=org">

					<!-- <i class="icon-road"></i>  -->

					<i class="icon-home"></i> 

					<span class="title">组织机构管理</span>
					
					<span class="selected"></span>

					</a>

				</li>
				<?php }?>
				
<!-- 				<php if((in_array('menu', $shownavlist) && (@in_array('菜单组管理',$_SESSION['loginInfo']['auth']))) || (in_array('menu', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?> -->

<!-- 				<li class="start <php if($navshow == 'menu'){echo 'active';}?>"> -->

<!-- 					<a href="/index.php?c=menu"> -->

<!-- 					<i class="icon-home"></i>  -->

<!-- 					<span class="title">菜单组管理</span> -->

<!-- 					</a> -->

<!-- 				</li> -->
<!-- 				<php }?> -->
				
				<?php if((in_array('view', $shownavlist) && (@in_array('意见反馈管理',$_SESSION['loginInfo']['auth']))) || (in_array('jobtalk', $shownavlist) && (@in_array('工作沟通管理',$_SESSION['loginInfo']['auth']))) || (in_array('question', $shownavlist) && (@in_array('更多问题管理',$_SESSION['loginInfo']['auth']))) || (in_array('usehelp', $shownavlist) && (@in_array('使用帮助管理',$_SESSION['loginInfo']['auth']))) || (in_array('view', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('jobtalk', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('question', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0) || (in_array('usehelp', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('appmenu', $shownavlist)){ ?> -->
				<li class=" start <?php if($navshow == 'view' || $navshow == 'jobtalk' || $navshow == 'question' || $navshow == 'usehelp'){echo 'active';}?>">
					<a href="javascript:;">
					<i class="icon-briefcase"></i> 
					<span class="title">沟通帮助</span>
					<span class="arrow "></span>
					</a>
					<ul class="sub-menu">
						<?php if((in_array('view', $shownavlist) && (@in_array('意见反馈管理',$_SESSION['loginInfo']['auth']))) || (in_array('view', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=view">
							<i class="icon-cogs"></i>
							意见反馈管理</a>
						</li>
						<?php }?>
						<?php if((in_array('jobtalk', $shownavlist) && (@in_array('工作沟通管理',$_SESSION['loginInfo']['auth']))) || (in_array('jobtalk', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=jobtalk">
							<i class="icon-cogs"></i>
							工作沟通管理</a>
						</li>
						<?php }?>
						<?php if((in_array('question', $shownavlist) && (@in_array('更多问题管理',$_SESSION['loginInfo']['auth']))) || (in_array('question', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=question">
							<i class="icon-cogs"></i>
							更多问题管理</a>
						</li>
						<?php }?>
						<?php if((in_array('usehelp', $shownavlist) && (@in_array('使用帮助管理',$_SESSION['loginInfo']['auth']))) || (in_array('usehelp', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
						<li >
							<a href="/index.php?c=usehelp">
							<i class="icon-cogs"></i>
							使用帮助管理</a>
						</li>
						<?php }?>
					</ul>
				</li>
				<?php }?>
				
				<?php if((in_array('version', $shownavlist) && (@in_array('版本管理',$_SESSION['loginInfo']['auth']))) || (in_array('version', $shownavlist) && $_SESSION['loginInfo']['loginid'] == 0)){ ?>
<!-- 				<php if(in_array('kaoqin', $shownavlist)){ ?> -->
				<li class="start <?php if($navshow == 'version'){echo 'active';}?>">

					<a href="/index.php?c=version">

					<i class="icon-home"></i> 

					<span class="title">版本管理</span>
					
					<span class="selected"></span>

					</a>

				</li>
				<?php }?>
				
				
				<!--<li class="<!--active--> <!-- ">-->

					<!--<a href="javascript:;">

					<i class="icon-cogs"></i> 

					<span class="title">布局</span>

					<!--<span class="selected"></span>

					<span class="arrow open"></span>-->

					<!--</a>

					<ul class="sub-menu">

						<li >
							<a href="layout_horizontal_menu1.html">Horzontal Menu 1</a>
						</li>

						<li class="active">
							<a href="layout_blank_page.html">Blank Page</a>
						</li>

						<li >
							<a href="layout_boxed_not_responsive.html">Non-Responsive Boxed Layout</a>
						</li>

					</ul>

				</li>-->


				<!--<li class="">

					<a href="javascript:;">

					<i class="icon-briefcase"></i> 

					<span class="title">Pages</span>

					<span class="arrow "></span>

					</a>

					<ul class="sub-menu">

						<li >
							<a href="page_timeline.html">
							<i class="icon-time"></i>
							Timeline</a>
						</li>

						<li >
							<a href="page_coming_soon.html">
							<i class="icon-cogs"></i>
							Coming Soon</a>
						</li>

						<li >
							<a href="page_blog.html">
							<i class="icon-comments"></i>
							Blog</a>
						</li>

						<li >
							<a href="page_blog_item.html">
							<i class="icon-font"></i>
							Blog Post</a>
						</li>

						<li >
							<a href="page_news.html">
							<i class="icon-coffee"></i>
							News</a>
						</li>

						<li >
							<a href="page_news_item.html">
							<i class="icon-bell"></i>
							News View</a>
						</li>

						<li >
							<a href="page_about.html">
							<i class="icon-group"></i>
							About Us</a>
						</li>

						<li >
							<a href="page_contact.html">
							<i class="icon-envelope-alt"></i>
							Contact Us</a>
						</li>

						<li >
							<a href="page_calendar.html">
							<i class="icon-calendar"></i>
							Calendar</a>
						</li>
					</ul>
				</li>-->

				<!--<li>
					<a class="active" href="javascript:;">
						<i class="icon-sitemap"></i>
						<span class="title">3 Level Menu</span>
						<span class="arrow "></span>
					</a>
					
					<ul class="sub-menu">
						<li>
							<a href="javascript:;">
								Item 1
								<span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li><a href="#">Sample Link 1</a></li>
								<li><a href="#">Sample Link 2</a></li>
								<li><a href="#">Sample Link 3</a></li>
							</ul>
						</li>

						<li>
							<a href="javascript:;">
								Item 1
								<span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li><a href="#">Sample Link 1</a></li>
								<li><a href="#">Sample Link 1</a></li>
								<li><a href="#">Sample Link 1</a></li>
							</ul>
						</li>
						<li>
							<a href="#">Item 3</a>
						</li>
					</ul>
				</li>-->

				<!--<li>
					<a href="javascript:;">
						<i class="icon-folder-open"></i> 
						<span class="title">4 Level Menu</span>
						<span class="arrow "></span>
					</a>

					<ul class="sub-menu">
						<li>
							<a href="javascript:;">
								<i class="icon-cogs"></i> 
								Item 1
								<span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li>
									<a href="javascript:;">
										<i class="icon-user"></i>
										Sample Link 1
										<span class="arrow"></span>
									</a>
									<ul class="sub-menu">
										<li><a href="#"><i class="icon-remove"></i> Sample Link 1</a></li>
										<li><a href="#"><i class="icon-pencil"></i> Sample Link 1</a></li>
										<li><a href="#"><i class="icon-edit"></i> Sample Link 1</a></li>
									</ul>
								</li>
								<li><a href="#"><i class="icon-user"></i>  Sample Link 1</a></li>
								<li><a href="#"><i class="icon-external-link"></i>  Sample Link 2</a></li>
								<li><a href="#"><i class="icon-bell"></i>  Sample Link 3</a></li>
							</ul>
						</li>

						<li>
							<a href="javascript:;">
								<i class="icon-globe"></i> 
								Item 2
								<span class="arrow"></span>
							</a>
							<ul class="sub-menu">
								<li><a href="#"><i class="icon-user"></i>  Sample Link 1</a></li>
								<li><a href="#"><i class="icon-external-link"></i>  Sample Link 1</a></li>
								<li><a href="#"><i class="icon-bell"></i>  Sample Link 1</a></li>
							</ul>
						</li>

						<li>
							<a href="#">
								<i class="icon-folder-open"></i>
								Item 3
							</a>
						</li>
					</ul>
				</li>-->

				<!--<li class="last ">
					<a href="#">
						<i class="icon-bar-chart"></i> 
						<span class="title">默认</span>
					</a>
				</li>-->

			</ul>

			<!-- END SIDEBAR MENU -->

		</div>

		<!-- END SIDEBAR -->
		

		<!-- BEGIN PAGE -->

		<div class="page-content">

			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<div id="portlet-config" class="modal hide">

				<div class="modal-header">

					<button data-dismiss="modal" class="close" type="button"></button>

					<h3>门户设置</h3>

				</div>

				<div class="modal-body">

					<p>这里将是一个配置形式</p>

				</div>

			</div>

			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN STYLE CUSTOMIZER -->

						<div class="color-panel hidden-phone">

							<div class="color-mode-icons icon-color"></div>

							<div class="color-mode-icons icon-color-close"></div>

							<div class="color-mode">

								<p>主题颜色</p>

								<ul class="inline">

									<li class="color-black color-default" data-style="default"></li>

									<li class="color-blue current" data-style="blue"></li>

									<li class="color-brown" data-style="brown"></li>

									<li class="color-purple" data-style="purple"></li>

									<li class="color-grey" data-style="grey"></li>

									<li class="color-white color-light" data-style="light"></li>

								</ul>

								<label>

									<span>布局</span>

									<select class="layout-option m-wrap small">

										<option value="fluid" selected>不固定</option>

										<option value="boxed">盒子</option>

									</select>

								</label>

								<label>

									<span>页头</span>

									<select class="header-option m-wrap small">

										<option value="fixed" selected>Fixed</option>

										<option value="default">Default</option>

									</select>

								</label>

								<label>

									<span>左边栏</span>

									<select class="sidebar-option m-wrap small">

										<option value="fixed">Fixed</option>

										<option value="default" selected>Default</option>

									</select>

								</label>

								<label>

									<span>页脚</span>

									<select class="footer-option m-wrap small">

										<option value="fixed">Fixed</option>

										<option value="default" selected>Default</option>

									</select>

								</label>

							</div>

						</div>

						<!-- END BEGIN STYLE CUSTOMIZER --> 
						
						<!-- BEGIN PAGE TITLE & BREADCRUMB-->
						<?=$breadcrumb?>
						<!-- END PAGE TITLE & BREADCRUMB-->
					</div>

				</div>

				<!-- END PAGE HEADER-->