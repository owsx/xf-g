<?=$this->load('/header')?>

<form method="post" action="<?=U('do_create')?>">
<p><?=L('char_name')?> : <input type="text" name="name" maxlength="16" /></p>

<p><button type="submit"><?=L('create')?></button></p>
</form>
<p><a href="<?=U('index')?>"><?=L('return')?></a></p>

<?=$this->load('/footer')?>
