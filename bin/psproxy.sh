#!/usr/bin/env bash

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