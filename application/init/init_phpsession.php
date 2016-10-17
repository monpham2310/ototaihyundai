<?php if (!defined('BASEPATH')) exit('No direct script access allowed');
if ( ! class_exists('Phpsession'))
{
     require_once(APPPATH.'libraries/Phpsession'.EXT);
}
$obj =& get_instance();
$obj->Phpsession = new Phpsession();
$obj->ci_is_loaded[] = 'Phpsession';
?>