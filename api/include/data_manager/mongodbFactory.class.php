<?php
class mongodbFactory implements dataManagerInterface{
	
	private static $_instance;
	
	private static $_mongodb;
	
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
	
	public function createConnect(){
		if ( !(self::$_mongodb instanceof MongoClient)){
			self::$_mongodb = new MongoClient('mongodb://localhost:27017');
		}
		return self::$_mongodb;
	}
}