<?php

class x_char {
	public $id;
	public $data;
	
	function __construct() {
		if ( isset($_SESSION['char_id']) ) {
			$this->login();
		}
		T('Char Class Initialized','trace');
	}

	function login() {
		$id = $_SESSION['char_id'];
		if ( $id ) {
			$db =& LC('db');
			$sql =  "SELECT * FROM `character` WHERE `del`='0' AND `id`='{$id}'";
			$rs = $db->get($sql);
			if ( $rs['total'] == 1 ) {
				$this->data = $rs['data'];
				$this->id = $rs['data']['id'];
				return;
			}
			$this->check();
		}
		unset($_SESSION['user']);
	}
	
	function check() {
		$db =& LC('db');
		$max_exp = 2;
		if ( $this->data['exp'] >= $max_exp ) {
			$i['exp'] = $this->data['exp']-$max_exp;
			$i['level'] = $this->data['level']+1;
			$sql = "UPDATE `character` SET `exp`='{$i['exp']}',`level`='{$i['level']}' WHERE `del`='0' AND `id`='{$this->id}'";
			$db->get($sql);
			$this->login();
		}
		
		
	}

}
