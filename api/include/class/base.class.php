<?php
/**
 * @abstract 基类（基于数据库链接，模板实例化，以及其他数据库底层操作）
 * @author wangkai
 * @copyright 20130827
 */

if ( !defined("xinlangAPI") ) {
	exit("Hacking attempt");
}

class baseclass{
	
	protected $db;
	protected $mongodb;
	protected $memcache;
	
	protected $smarty;
	private $open_system_os = array();
	
	protected function __construct($open_system_os = NULL){
		$this -> open_system_os = $open_system_os;
		if ( @$this -> open_system_os['need_db_connect'] === true){
			$this -> db = @in_array('mysql', $this -> open_system_os['datamanagers']) ? dataMamagerFactory::getInstance() -> getObjects('mysqlPdoFactory') : $this -> db;
			$this -> mongodb = @in_array('mongodb', $this -> open_system_os['datamanagers']) ? dataMamagerFactory::getInstance() -> getObjects("mongodbFactory") : $this -> mongodb;
			$this -> memcache = @in_array('memcache', $this -> open_system_os['datamanagers']) ? dataMamagerFactory::getInstance() -> getObjects('memcacheFactory') : $this -> memcache;
			if (!$this -> db && !$this -> memcache && !$this -> mongodb){
				exit('请选择明确你要使用的数据管理软件');
			}
		}
	}
}