<?php
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/select2_metro.css" />';
$css_include[] = '<link rel="stylesheet" type="text/css" href="/css/DT_bootstrap.css" />';
?>

<?php include VIEWPATH . 'header.php' ?>


                <!-- BEGIN PAGE CONTENT-->
                
                <div class="row-fluid">

                    <div class="span12">

                        <!-- BEGIN EXAMPLE TABLE PORTLET-->

                        <div class="portlet box light-grey">

                            <div class="portlet-title">

                                <div class="caption"><i class="icon-globe"></i>欢迎页</div>

                                <div class="tools">

                                    <a href="javascript:;" class="collapse"></a>

                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>

                                    <a href="javascript:;" class="reload"></a>

                                    <a href="javascript:;" class="remove"></a>

                                </div>

                            </div><br/>
                        
                        <!-- END EXAMPLE TABLE PORTLET-->

                    </div>
					
					<h1 align="center" style="margin-top:130px;">您好 ! 欢迎来到乐居项目管理后台</h1>

                </div>

                <!-- END PAGE CONTENT-->
<?php
$js_include[] = '<script type="text/javascript" src="/js/select2.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/jquery.dataTables.js"></script>';

$js_include[] = '<script type="text/javascript" src="/js/DT_bootstrap.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/webadmin/showauth.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>

<script>

</script>