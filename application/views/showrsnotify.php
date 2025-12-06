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

                                <div class="caption"><i class="icon-globe"></i>人事通知列表</div>

                                <div class="tools">

                                    <a href="javascript:;" class="collapse"></a>

                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>

                                    <a href="javascript:;" class="reload"></a>

                                    <a href="javascript:;" class="remove"></a>

                                </div>

                            </div>

                            <div class="portlet-body">

                                <div class="clearfix">

                                    <div class="btn-group">

                                        <button id="sample_editable_1_new" class="btn green" onClick='location="/index.php?c=rsnotify&m=add"'>

                                        添加 <i class="icon-plus"></i>

                                        </button>
                                        
<!--                                        <button class="btn" onClick='deleteList();'>

                                         批量删除 -->

<!--                                         </button> -->

                                    </div>

<!--                                     <div class="btn-group pull-right"> -->

<!--                                         <button class="btn dropdown-toggle" data-toggle="dropdown"> -->
<!--                                             工具 <i class="icon-angle-down"></i> -->
<!--                                         </button> -->

<!--                                         <ul class="dropdown-menu pull-right"> -->
<!--                                             <li><a href="#">打印</a></li> -->
<!--                                             <li><a href="#">保存成 PDF</a></li> -->
<!--                                             <li><a href="#">Excel导出</a></li> -->
<!--                                         </ul> -->

<!--                                     </div> -->

                                </div>

                                <table class="table table-striped table-bordered table-hover" id="sample_rsnotify_1">

                                    <thead>
                                        <tr>
                                            <th style="width:8px;">
                                                <input type="checkbox" class="group-checkable" data-set="#sample_rsnotify_1 .checkboxes" />
                                            </th>
                                            <th>ID</th>
                                            <th class="hidden-480">发通知人</th>
                                            <th class="hidden-480">发通知部门</th>
                                            <th class="hidden-480">通知标题</th>
                                            <th class="hidden-480">通知添加时间</th>
                                            <th class="hidden-480">通知状态</th>
                                            <th class="hidden-480">操作</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <tr>
                                            <td colspan="8">正在加载数据...</td>
                                        </tr>
                                    </tbody>

                                </table>

                            </div>

                        </div>

                        <!-- END EXAMPLE TABLE PORTLET-->

                    </div>

                </div>

                <!-- END PAGE CONTENT-->
<?php
$js_include[] = '<script type="text/javascript" src="/js/select2.min.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/jquery.dataTables.js"></script>';

$js_include[] = '<script type="text/javascript" src="/js/DT_bootstrap.js"></script>';
$js_include[] = '<script type="text/javascript" src="/js/webadmin/showrsnotify.js"></script>';
?>
<?php include VIEWPATH . 'footer.php' ?>

<script>

</script>