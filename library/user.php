<?php

class x_user {
	public $id;
	public $name;
	public $level;
	public $islogin = FALSE;
	
	function __construct() {
		if ( !$this->islogin && isset($_SESSION['user']) ) {
			$this->login();
		}
		if ( !$this->islogin && isset($_COOKIE['uname']) && isset($_COOKIE['upass']) ) {
			$this->cookie_login();
		}
		T('User Class Initialized','trace');
	}

	function update() {
		if ( $this->islogin ) {
			$time = _T;
			$sql = "UPDATE account SET online='1',active_time='{$time}' WHERE username='{$this->name}' ";
			$this->db->query($sql);
		}
	}

	// 使用cookie登录
	function cookie_login() {
		$db =& LC('db');
		$uname = $_COOKIE['uname'];
		$upass = $_COOKIE['upass'];
		if ( $uname && $upass ) {
			$sql = "SELECT * FROM account WHERE name='{$uname}' AND pass='{$upass}'";
			$rs = $db->get($sql);
			if ( $rs['total'] == 1 ) {
				$_SESSION['user'] = array(
					'id' => $rs['data']['id'],
					'name' => $rs['data']['name'],
					'level' => $rs['data']['level'],
					'ip' => _IP,
				);
				$this->login();
				return;
			}
		}
		setcookie('uname','',time()-1,_U);
		setcookie('upass','',time()-1,_U);
	}
	
	// 使用session登录，用户调整下次登录时变化。
	function login() {
		if ( $_SESSION['user']['ip'] == _IP ) {
			$this->id = $_SESSION['user']['id'];
			$this->name = $_SESSION['user']['name'];
			$this->level = $_SESSION['user']['level'];
			$this->islogin = TRUE;
		} else {
			unset($_SESSION['user']);
		}
	}
	
	// 连接sql登录，用户调整实时变化，但更耗资源。暂未使用。（以后考虑仅对level>0的用户采用sql登录，普通用户直接使用session登录）
	function test() {
		if ( $_SESSION['user']['ip'] == _IP ) {
			$name = $_SESSION['user']['name'];
			$db =& LC('db');
			$sql = "SELECT * FROM account LEFT JOIN account_access ON account.id=account_access.id WHERE username='{$name}' ";
			$rs = $db->get($sql);
			if ( $rs['total'] == 1 ) {
				$this->id = $rs['data']['id'];
				$this->name = $rs['data']['username'];
				$this->level = $rs['data']['gmlevel'];
				$this->islogin = TRUE;
				return;
			}
		}
		unset($_SESSION['user']);
	}

}
