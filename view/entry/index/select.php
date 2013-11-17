<?=$this->load('/header')?>

<form method="post" action="<?=U('do_select')?>">
<ul>
<?foreach($rs['data'] as $row):?>
<li><label>
	<input type="radio" name="char" value="<?=$row['id']?>"/>
	<?=L('char_name')?> : <?=$row['name']?>
	<?=L('char_level')?> : <?=$row['level']?>
</li></label>
<?endforeach;?>
</ul>
<?if($rs['total']):?>
<p><button type="submit"><?=L('enter')?></button></p>
<?endif;?>
</form>

<?if($rs['total'] < $char_limit):?>
<p><a href="<?=U('create')?>"><?=L('create')?></a></p>
<?endif;?>

<?=$this->load('/footer')?>
