# pkg_privilege_escalation_script
shellscript for pkg_privilege_escalation

sudo -l

->
    
    (ALL) NOPASSWD: /usr/sbin/pkg update
    
    (ALL) NOPASSWD: /usr/sbin/pkg install *

if get situation like a adove, when pressed "sudo -l"

then exploitable in this script,,, maybe


usage:
    
    ./pkg_priv_esc.sh <lhost> <lport>
    
 
 Don't forget "chmod +x" before execute 
