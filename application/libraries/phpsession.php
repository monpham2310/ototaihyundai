<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Phpsession {
    var $_flash = array();
    
    // constructor
    function Phpsession() {
        session_start();
        $this->flashinit();
    }
    
    function saveCookie($val, $namespace = 'default'){                
        setcookie($namespace, $val, time() + (86400 * 30), '/');        
    }
    
    function getCookie($namespace = 'default') {
        return isset($_COOKIE[$namespace]) ? $_COOKIE[$namespace] : null;
    }
    
    function clearCookie($namespace = 'default') {
        // set the expiration date to one hour ago
        setcookie($namespace, null, time() - 3600);
    }
    
    function save($var, $val, $namespace = 'default') {
        if ($var == null) {
            $_SESSION[$namespace] = $val;
        } else {
            $_SESSION[$namespace][$var] = $val;
        }
    }
    
    function get($var = null, $namespace = 'default') {
        if(isset($var))
            return isset($_SESSION[$namespace][$var]) ? $_SESSION[$namespace][$var] : null;
        else
            return isset($_SESSION[$namespace]) ? $_SESSION[$namespace] : null;
    }
    
    function clear($var = null, $namespace = 'default') {
        if(isset($var) && ($var !== null))
            unset($_SESSION[$namespace][$var]);
        else
            unset($_SESSION[$namespace]);
    }

    /* Initializes the flash variable routines
     */
    function flashinit() {
        $this->_flash = $this->get(null, 'flash');
        $this->clear(null, 'flash');
    }

    /* Saves a flash variable. These are only saved for one page load
     * @paramstringVariable name to save
     * @parammixedValue to save
     */
    function flashsave($var, $val) {
        $this->save($var, $val, 'flash');
    }

    /* Gets the value of a flash variable. These are only saved for one page load, so the variable must
     * have either been set or had flashkeep() called on the previous page load
     * @paramstringVariable name to get
     */
    function flashget($var) {
        if (isset($this->_flash[$var])) {
            return $this->_flash[$var];
        } else {
            return null;
        }
    }

    /* Keeps the value of a flash variable for another page load.
     * @paramstring(optional) Variable name to keep, or null to keep all. Defaults to keep all (null)
     */
    function flashkeep($var = null) {
        if ($var != null) {
            $this->flashsave($var, $this->flashget($var));
        } else {
            $this->save(null, $this->_flash, 'flash');
        }
    }
}
?>