<?php
class memcacheFactory implements dataManagerInterface{
	
	private static $_instance;
	
	private static $_memcache;
	
	private function __construct(){
		
	}
	
	private function __clone(){
		
	}
	
	public static function getInstance(){
		if ( !(self::$_instance instanceof self) ){
			self::$_instance = new self();
		}
		return self::$_instance;
	}
	
	//
	public function createConnect(){
		if ( !(self::$_memcache instanceof Memcache) ){
			self::$_memcache = new Memcache();
// 			self::$_memcache -> addserver("192.168.1.8", 11211, true, 10);
// 			self::$_memcache -> addserver("127.0.0.1", 11211, true, 20);
			
			self::$_memcache -> addserver('10.71.32.139', 7601);
			self::$_memcache -> addserver('10.71.32.139', 7601);
			self::$_memcache -> addserver('10.71.32.139', 7602);
			self::$_memcache -> addserver('10.71.32.139', 7603);
			self::$_memcache -> addserver('10.71.32.139', 7604);
			self::$_memcache -> addserver('10.71.32.140', 7601);
			self::$_memcache -> addserver('10.71.32.140', 7602);
			self::$_memcache -> addserver('10.71.32.140', 7603);
			self::$_memcache -> addserver('10.71.32.140', 7604);
		}
		return self::$_memcache;
	}
	
	public function  createConnect2(){
		if ( !(self::$_memcache instanceof Memcached) ){
			self::$_memcache = new Memcached();
			$servers = array(
				array('10.71.32.139', '7601', '10'),
				array('10.71.32.139', '7602', '11'),
				array('10.71.32.139', '7603', '12'),
				array('10.71.32.139', '7604', '13'),
				array('10.71.32.140', '7601', '14'),
				array('10.71.32.140', '7602', '15'),
				array('10.71.32.140', '7603', '16'),
				array('10.71.32.140', '7604', '17')
			);
			self::$_memcache -> addServers($servers);
		}
		return self::$_memcache;
	}
}