<?php

function web_header() {
	$user =& LC('user');
	$tmp = '<div class="user">';
	if ( $user->islogin ) {
		$tmp .= '<span>'.$user->name.'</span>';
		if ( $user->level >= 5 ) $tmp .= '<a href="'.U('/admin').'">'.L('system_manage').'</a>';
		$tmp .= '<a href="'.U('/public/index/logout').'">'.L('logout').'</a>';
	} else {
		$tmp .= '<a href="'.U('/public/index/login').'">'.L('login').'</a>';
		$tmp .= '<a href="'.U('/public/index/register').'">'.L('register').'</a>';
	}
	$tmp .= '</div>';
	return $tmp;
}
