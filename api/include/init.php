<?php
/**
 * @abstract	系统配置文件
 * @author		wk
 * @copyright	20140208
 */


/**
 * 系统下文件调用标识，防止恶意调用
 */
if (!defined("xinlangAPI")){
	exit("Hacking attempt");
}

/**
 * header声明字符集
 */
header("Content-type: text/html; charset=utf-8");

/**
 * 设置时区环境变量
 */
date_default_timezone_set ( "Asia/Shanghai" );

/**
 * 设置全局引用路径常量
 */
define("ROOT_PATH", str_replace("/api/include/init.php", "", str_replace("\\", "/", __FILE__)));

define("API_ROOT_PATH", str_replace("/include/init.php", "", str_replace("\\", "/", __FILE__)));

/**
 * 设置include_path配置选项
 */
set_include_path(get_include_path() . PATH_SEPARATOR . API_ROOT_PATH);

/**
 * 引用config/database.php配置文件
 */
define( 'BASEPATH', true);
include_once (ROOT_PATH . '/application/config/database.php');
include_once (ROOT_PATH . '/application/config/oa_config.php');

include_once ('include/config/define.config.php');

/**
 * 引用公用方法文件
 */

include_once ( 'include/lib_common/lib_common.php' );


/**
 * 传值预处理
 */
if (!get_magic_quotes_gpc())
{
	if (!empty($_GET))
	{
		$_GET  = addslashes_deep($_GET);
	}
	if (!empty($_POST))
	{
		$_POST = addslashes_deep($_POST);
	}

	$_COOKIE   = addslashes_deep($_COOKIE);
	$_REQUEST  = addslashes_deep($_REQUEST);
}

/**
 * 遍历class文件夹下的公用基础类
 */
load_lib('include/class','class.php');

/**
 * 遍历libraries文件夹下的公用基础类
 */
load_lib('include/libraries','class.php');

/**
 * 遍历interface文件夹下的接口类
 */
load_lib("include/interface", "interface.php");
