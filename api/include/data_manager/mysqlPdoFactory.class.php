<?php
class mysqlPdoFactory implements dataManagerInterface{
	
	private static $_instance;
	
	private static $_mysqlPDO;
	
	private function __construct(){
		
	}
	
	public static function getInstance(){
		if ( !(self::$_instance instanceof self) ){
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	
	public function createConnect(){
		if ( !(self::$_mysqlPDO instanceof PDO) ){
			global $db;
			$opt = array(PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC); 
			self::$_mysqlPDO = new PDO($db['default']['dsn'], $db['default']['username'], $db['default']['password'], $opt);
			//PDO关联数组形式fetch返回方式   self::$_mysqlPDO ->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
			unset($db_host,$db_username, $db_pw, $opt);
		}
		return self::$_mysqlPDO;
	}
	
}