<?php
if (!defined('xinlangAPI')){
	exit("hacking attempt");
}
/**
 * 工厂模式创建数据管理工具链接池接口标准
 * @author kai
 */
interface dataManagerInterface{
	
	function createConnect();
	
}