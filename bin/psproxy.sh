#!/usr/bin/env bash

# Toggle the proxy settings for Junos Pulse Secure
# ./psproxy.sh on # To toggle proxy settings on
# ./psproxy.sh off # To toggle proxy settings off
#
# Taken from https://gist.github.com/mivasi/bc0046aa2277a64726c8

juniperState=`scutil << EOF
show State:/Network/Service/net.juniper.pulse.nc.main/IPv4
quit
EOF`


serviceKey=`echo $juniperState | sed -n "s/.*DSUnderlyingServiceName : \([^']*\) }.*/\1/p"`

if [ $1 == "on" ]; then
		echo
		echo "Enabling proxy settings..."

		results=`scutil<< EOF
  d.init
  get Setup:/Network/Service/${serviceKey}/Proxies
  set State:/Network/Service/net.juniper.pulse.nc.main/Proxies
  quit
  EOF`

elif [ $1 == "off" ]; then
  echo
  echo "Disabling proxy settings..."

  results=`scutil<< EOF
  d.init
  get State:/Network/Service/net.juniper.pulse.nc.main/Proxies
  d.add HTTPSEnable 0
  d.add HTTPEnable 0
  set State:/Network/Service/net.juniper.pulse.nc.main/Proxies
  quit
  EOF`

else
  echo
  echo "Execute 'psproxy on' to enable the proxy settings"
  echo "Execute 'psproxy off' to disable the proxy settings"

  exit
fi

echo $results;