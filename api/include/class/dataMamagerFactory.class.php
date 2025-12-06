<?php
/**
 * @abstract 数据管理工厂单利入口类，根据getObjects方法传入要使用的数据管理名称实例化加载对应的模块
 * @author kai
 *	@copyright 2015.03.04
 */
class dataMamagerFactory{
	
	private static $_instance;
	
	private $type_args;
	
	private function __construct(){
		
	}
	
	private function __clone(){
		
	}
	
	public static function getInstance(){
		if ( !(self::$_instance instanceof self) ){
			self::$_instance = new dataMamagerFactory();
		}
		return self::$_instance;
	}
	
	public function getObjects($type_args){
		include_once 'include/data_manager/'.$type_args.'.class.php';
		return $type_args::getInstance() -> createConnect();
	}
}