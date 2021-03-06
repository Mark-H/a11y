<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" {if $_config.manager_direction EQ 'rtl'}dir="rtl"{/if} lang="{$_config.manager_lang_attribute}" xml:lang="{$_config.manager_lang_attribute}">
<head>
	<title>{$_lang.login_title}</title>
	<meta http-equiv="Content-Type" content="text/html; charset={$_config.modx_charset}" />
    {if $_config.manager_favicon_url}<link rel="shortcut icon" type="image/x-icon" href="{$_config.manager_favicon_url}" />{/if}

    <!--<link rel="stylesheet" type="text/css" href="{$_config.manager_url}assets/ext3/resources/css/ext-all-notheme-min.css" />-->
  	<link rel="stylesheet" type="text/css" href="{$_config.manager_url}templates/a11y-theme/css/index.css" />
    <link rel="stylesheet" type="text/css" href="{$_config.manager_url}templates/a11y-theme/css/login.css" />

    {if $_config.ext_debug}
    <script src="{$_config.manager_url}assets/ext3/adapter/ext/ext-base-debug.js" type="text/javascript"></script>
    <script src="{$_config.manager_url}assets/ext3/ext-all-debug.js" type="text/javascript"></script>
    {else}
    <script src="{$_config.manager_url}assets/ext3/adapter/ext/ext-base.js" type="text/javascript"></script>
    <script src="{$_config.manager_url}assets/ext3/ext-all.js" type="text/javascript"></script>
    {/if}
    <script src="assets/modext/core/modx.js" type="text/javascript"></script>

    <script src="assets/modext/core/modx.component.js" type="text/javascript"></script>
    <script src="assets/modext/util/utilities.js" type="text/javascript"></script>
	<script src="assets/modext/widgets/core/modx.panel.js" type="text/javascript"></script>
    <script src="assets/modext/widgets/core/modx.window.js" type="text/javascript"></script>
    <script src="{$_config.manager_url}templates/{$_config.manager_theme}/js/modext/sections/login.js" type="text/javascript"></script>

    <meta name="robots" content="noindex, nofollow" />
    
    {if $error_message}
    
    	<script type="text/javascript">
	    	
	    	function ariaInvalid(){
		    	var activeForm = Ext.state.Manager.get("actForm");
		    	if(activeForm == "login"){ 
				    document.getElementById("modx-login-username").setAttribute('aria-invalid', 'true');
				    document.getElementById("modx-login-password").setAttribute('aria-invalid', 'true'); 
				} else { 
					document.getElementById("modx-login-form").style.display = 'none';
					document.getElementById("modx-forgot-login-form").style.display = 'block';
				    document.getElementById("modx-login-username-reset").setAttribute('aria-invalid', 'true'); 
				}
				
		    	//reset
		    	Ext.state.Manager.set("actForm", "");
			}    
		    
        	function setFocusToTextBox(){ document.getElementById("errorMsg").focus(); }
        	
        </script>
        
    {else}
    
        <script type="text/javascript">
	        function ariaInvalid(){ Ext.state.Manager.set("actForm", ""); } //reset
	        
        	function setFocusToTextBox(){ document.getElementById("modx-login-username").focus(); }
        </script>
        
    {/if}
    
    <script type="text/javascript">
	    
	    function initLogin() {
	    	
	    	//enable setProvider to use Cookies
	    	Ext.state.Manager.setProvider(new Ext.state.CookieProvider());	
	    	
	    	//set focus
	    	setFocusToTextBox();
	    
			//functions to set which form was clicked
	    	function setLoginPress(){ Ext.state.Manager.set("actForm", "login"); }
	    	function setForgotPress(){ Ext.state.Manager.set("actForm", "forgot"); }
			ariaInvalid();
	    	
	    	
	    	//Listeners
			document.getElementById("modx-login-btn").addEventListener("click", setLoginPress, false);
			document.getElementById("modx-fl-btn").addEventListener("click", setForgotPress, false);
	    }
		     
    </script>
</head>

<body id="login" onload="initLogin()">
<div id="modx-login-language-select-div">
    <label>{$language_str}:
    <select name="cultureKey" id="modx-login-language-select">
        {$languages}
    </select>
    </label>
</div>
{$onManagerLoginFormPrerender}
<br />

<div id="container">
    <div id="modx-login-logo">
        <!--[if gte IE 9]><!--><img alt="MODX CMS/CMF" src="{$_config.manager_url}templates/default/images/modx-logo-color.svg" data-fallback="{$_config.manager_url}templates/default/images/modx-logo-color.png" onerror="this.src=this.getAttribute('data-fallback');this.onerror=null;" /><!--<![endif]-->
        <!--[if lt IE 9]><img alt="MODX CMS/CMF" src="{$_config.manager_url}templates/default/images/modx-logo-color.png" /><![endif]-->
    </div>

<div id="modx-panel-login-div" class="x-panel modx-form x-form-label-right">

	<div class="x-panel x-panel-noborder"><div class="x-panel-bwrap"><div class="x-panel-body x-panel-body-noheader">
        <h1>{$_config.site_name}</h1>
        <br class="clear" />

        {if $error_message}	
        	<p id="errorMsg" tabindex="1" class="error">{$error_message}</p>
        {/if}
    </div></div></div>
        
    <form id="modx-login-form" action="" method="post">
        <input type="hidden" name="login_context" value="mgr" />
        <input type="hidden" name="modahsh" value="{$modahsh}" />
        <input type="hidden" name="returnUrl" value="{$returnUrl}" />

        <div class="x-form-item login-form-item login-form-item-first">
          <label for="modx-login-username">{$_lang.login_username}</label>
          <div class="x-form-element login-form-element">
            <!--eliminate placeholder Issue #23
	            <input type="text" id="modx-login-username" name="username" tabindex="1" autocomplete="on" value="{$_post.username}" class="x-form-text x-form-field" placeholder="{$_lang.login_username}" />
	        -->    
            <input aria-required="true" type="text" id="modx-login-username" name="username" tabindex="1" autocomplete="on" value="{$_post.username}" class="x-form-text x-form-field" />
          </div>
        </div>

        <div class="x-form-item login-form-item">
          <label for="modx-login-password">{$_lang.login_password}</label>
          <div class="x-form-element login-form-element">
	        <!--eliminate placeholder Issue #23 
            <input type="password" id="modx-login-password" name="password" tabindex="2" autocomplete="on" class="x-form-text x-form-field" placeholder="{$_lang.login_password}" />
            -->
            <input aria-required="true" type="password" id="modx-login-password" name="password" tabindex="2" autocomplete="on" class="x-form-text x-form-field" />
          </div>
        </div>


        <div class="login-cb-row">
            <div class="login-cb-col one">
                <div class="modx-login-fl-link">
                   <a href="javascript:void(0);" id="modx-fl-link" style="{if $_post.username_reset}display:none;{/if}">{$_lang.login_forget_your_login}</a>
                </div>
            </div>
            <div class="login-cb-col two">
                <div class="x-form-check-wrap modx-login-rm-cb">
                    <input type="checkbox" id="modx-login-rememberme" name="rememberme" tabindex="3" autocomplete="on" {if $_post.rememberme}checked="checked"{/if} class="x-form-checkbox x-form-field" value="1" />
                    <label for="modx-login-rememberme" class="x-form-cb-label">{$_lang.login_remember}</label>
                </div>
                <button class="x-btn x-btn-small x-btn-icon-small-left primary-button x-btn-noicon login-form-btn" name="login" type="submit" value="1" id="modx-login-btn" tabindex="4">{$_lang.login_button}</button>
            </div>
        </div>

        {$onManagerLoginFormRender}
    </form>

    {if $allow_forgot_password}
      <div class="modx-forgot-login">
        <form id="modx-fl-form" action="" method="post">
           <div id="modx-forgot-login-form" style="{if NOT $_post.username_reset}display: none;{/if}">

               <div class="x-form-item login-form-item">
                  <div class="x-form-element login-form-element">
                    <label for="modx-login-username-reset">Username or Email</label>
                    <input type="text" id="modx-login-username-reset" name="username_reset" class="x-form-text x-form-field" value="{$_post.username_reset}" />
                  </div>
                  <div class="x-form-clear-left"></div>
               </div>


               <button class="x-btn x-btn-small x-btn-icon-small-left primary-button x-btn-noicon login-form-btn" name="forgotlogin" type="submit" value="1" id="modx-fl-btn">{$_lang.login_send_activation_email}</button>

           </div>
        </form>
        </div>
    {/if}

    <br class="clear" />
</div>

<p class="loginLicense">
{$_lang.login_copyright}
</p>
</div>

</body>
</html>
