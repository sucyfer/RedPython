#!/bin/bash



spin()
{
  spinner="/|\\-/|\\-"
  while :
  do
    for i in `seq 0 7`
    do
      echo -n "${spinner:$i:1}"
      echo -en "\010"
      sleep 0.1
    done
  done
}








# Installing python3 and pip3 python package manager
if sudo hostnamectl | grep "Debian" > /dev/null
then

  sudo apt-get install python3 python3-pip -y -qq

elif sudo hostnamectl | grep "Ubuntu" > /dev/null
then
  sudo apt-get install python3 python3-pip -y -qq  

elif sudo hostnamectl | grep "Fedora" > /dev/null
then
  sudo dnf -q install python3 python3-pip -y



elif sudo hostnamectl | grep "openSUSE" > /dev/null
  then
  sudo zypper -q install -y python3 python3-pip

fi
spin &
echo "Installing RedPython..." ;

# Installing RedPython libraries

pip3 -q install python-nmap impacket scapy requests cryptography beautifulsoup4 pandas yara faker pure-pcapy3 dpkt mechanize scipy numpy matplotlib twisted plotly pefile pexpect pynacl paramiko passlib 

echo Installed RedPython successfully!
SPIN_PID=$!
trap "kill -9 $SPIN_PID" `seq 0 15`


