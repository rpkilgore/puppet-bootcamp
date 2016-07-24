
#  PE Master profile
#  For now just to kick off the backup script once a week
#  Typically this would be determined by the Client

#  Usage, simple assign this profile to the PE Master group.

class profile::pemaster { 
 
 file { 'pe-backup.sh': 
   ensure => file, 
   path   => '/tmp/pe-backup.sh', 
   mode   => '0755', 
   source => "puppet:///modules/profile/pe-backup.sh",
 } 
    
 schedule { 'pe-backup': 
   range  => '21 - 23', 
   period => weekly, 
   repeat => 1, 
 } 
 
 exec { 'pe-backup execute cmd': 
  path     => [ '/usr/bin', '/usr/sbin' ], 
  command  => '/tmp/pe-backup.sh', 
  schedule => 'pe-backup',   
 }

}
