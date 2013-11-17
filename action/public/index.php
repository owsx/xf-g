<?php

class index_a extends public_action {
	
	function index() {
		R(U('login'));
	}

	function login() {

	}

	function register() {
		
	}

	function resetpass() {
		
	}

	function do_login() {
		$i['uname'] = I('post.uname');
		$i['upass'] = I('post.upass');
		$i['autologin'] = I('post.autologin');
		
		if ( !$i['uname'] || !$i['upass'] ) {
			msg('err.empty_fields');
		}
		
		$ip = _IP;
		$time = _T;

		$sql = "SELECT * FROM account WHERE `name`='{$i['uname']}'";
		$rs = $this->base['db']->get($sql);
		if ( $rs['total'] == 0 ) {
			msg('err.username_not_exist');
		}

		if ( $rs['data']['pass'] != $i['upass'] ) {
			msg('err.wrong_password');
		}
		
		$user = array(
			'id' => $rs['data']['id'],
			'name' => $rs['data']['name'],
			'level' => $rs['data']['level'],
			'ip' => $ip,
		);
		$_SESSION['user'] = $user;
		if ( $i['autologin'] ) {
			setcookie('uname',$i['uname'],$time+7*24*3600,_U);
			setcookie('upass',$i['upass'],$time+7*24*3600,_U);
		}

		R(U('/'));
	}

	function logout() {
		unset($_SESSION['user']);
		setcookie('uname','',time()-1,_U);
		setcookie('upass','',time()-1,_U);
		R(U('/'));
	}

}
