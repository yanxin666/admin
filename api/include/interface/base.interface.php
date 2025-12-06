<?php
if (!defined('xinlangAPI')){
	exit("hacking attempt");
}
interface baseInterface{
	
	function __construct();
	
	function __call($name, $args);
	
//	function index();
	
}
?>