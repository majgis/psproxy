#!/usr/bin/env bash

# Toggle the proxy settings for Junos Pulse Secure
# ./psproxy.sh on # To toggle proxy settings on
# ./psproxy.sh off # To toggle proxy settings off
#
# Taken from https://gist.github.com/mivasi/bc0046aa2277a64726c8

pulseSecureState=`scutil << EOF
show State:/Network/Service/net.pulsesecure.pulse.nc.main/IPv4
quit
EOF`

GR='\033[0;32m'
YL='\033[1;33m'
NC='\033[0m' # No Color

serviceKey=`echo $pulseSecureState | sed -n "s/.*DSUnderlyingServiceName : \([^']*\) }.*/\1/p"`

if [ $1 == "on" ]; then
  echo
  echo "Enabling proxy settings..."

  results=`scutil<< EOF
  d.init
  get Setup:/Network/Service/${serviceKey}/Proxies
  set State:/Network/Service/net.pulsesecure.pulse.nc.main/Proxies
  quit
  EOF`
  echo "${GR}Done!${NC}"

elif [ $1 == "off" ]; then
  echo
  echo "Disabling proxy settings..."

  results=`scutil<< EOF
  d.init
  get State:/Network/Service/net.pulsesecure.pulse.nc.main/Proxies
  d.add HTTPSEnable 0
  d.add HTTPEnable 0
  d.add ProxyAutoConfigEnable 0
  set State:/Network/Service/net.pulsesecure.pulse.nc.main/Proxies
  quit
  EOF`
  echo "${GR}Done!${NC}"

else
  echo
  echo "Execute ${YL}'sudo psproxy on'${NC} to enable the proxy settings"
  echo "Execute ${YL}'sudo psproxy off'${NC} to disable the proxy settings"

  exit
fi

echo $results;
