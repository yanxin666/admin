			
			</div>

			<!-- END PAGE CONTAINER--> 

		</div>

		<!-- END PAGE -->    

	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer">

		<div class="footer-inner">

			2015 &copy; 新浪乐居系统. - 技术服务 <a href="http://www.matouit.com/" target="_blank" title="北京码投信息技术有限公司模板之家">北京码投信息技术有限公司</a>

		</div>

		<div class="footer-tools">

			<span class="go-top">

			<i class="icon-angle-up"></i>

			</span>

		</div>

	</div>

	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="/js/excanvas.min.js"></script>

	<script src="/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="/js/jquery.uniform.min.js" type="text/javascript" ></script>

	<!-- END CORE PLUGINS -->

	<script src="/js/app.js" type="text/javascript" ></script>      

	<?php
	$js_include []= '';
	foreach($js_include as $js){
		echo $js,PHP_EOL;
	}
	?>
	
	<script>

		jQuery(document).ready(function() {    

		   App.init();

		});

	</script>

	<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>