## COMMANDS for Personal server  Ubuntu 16.04 LTS | DigitalOcean ##

### Install Commands ###

    ./install.sh


### Name: server_admin_scripts
       adminsc - Custom commands for server things

**SYNOPSIS**

	**adminsc_create_site** **[SITE-NAME]**... **[localhost/index]**...
       (prepare the git server and put source in _SERVER_PATH)

 - localhost - change server to local 	
 - index - use root _SERVER_PATH for
   deploy

	**adminsc_set_up_lumen** 
	*(Insall composer and lumen micro-framework)*

	**adminsc_create_vhost**  **[OPTION]** **[DOMAIN]** **[DIRECTORY]**
	
	*OPTION*
	
	{-vhost|-vhostr}	
		
	*DOMAIN*
	
	subdomain name 		
	
	*DIRECTORY*
	
	DocumentRoot off subdomain
