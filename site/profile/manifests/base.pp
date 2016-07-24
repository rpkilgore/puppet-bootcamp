class profile::base {

   #Pull info from Hiera
   $ntp_servers = hiera('ntp::servers') 
   $nameservers = hiera('nameservers') 

   # modify sysctl
   create_resources('sysctl' , hiera_hash('sysctl'))

   # ntp config
   class { '::ntp':
       servers => $ntp_servers,
   }
	    
   ## DNS Config 
   class { '::resolv_conf': 
     nameservers => $nameservers, 
   } 
    
}
