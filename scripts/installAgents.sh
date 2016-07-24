#!/usr/bin/expect


set host [lindex $argv 0]

spawn ssh -o "StrictHostKeyChecking no" $host "ls && pwd && curl -k https://master.puppet.lan:8140/packages/current/install.bash --output install.bash && sudo bash install.bash"
expect "password"
send "vagrant\r"

interact

