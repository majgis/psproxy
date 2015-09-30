#!/usr/bin/env bash

juniperState=`scutil << EOF
show State:/Network/Service/net.juniper.pulse.nc.main/IPv4
quit
EOF`


serviceKey=`echo $juniperState | sed -n "s/.*DSUnderlyingServiceName : \([^']*\) }.*/\1/p"`

if [ $1 == "on" ]; then
		echo
		echo "Turning the proxy on..."
		echo

		results=`scutil<< EOF
  d.init
  get Setup:/Network/Service/${serviceKey}/Proxies
  set State:/Network/Service/net.juniper.pulse.nc.main/Proxies
  quit
  EOF`

elif [ $1 == "off" ]; then
  echo
  echo "Turning the proxy off..."
  echo

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
  echo "Execute 'psproxy on' to turn the proxy on"
  echo "Execute 'psproxy off' to turn the proxy off"
  echo

  exit
fi

echo $results;