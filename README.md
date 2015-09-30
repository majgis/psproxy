# psproxy

A simple way to toggle the proxy settings for Pulse Secure VPN.

This utility was created to solve the problem of [Charles Proxy][1](v3.10.2) not 
working when connected to a VPN using [Pulse Secure][2](v5.1.3) on 
Mac OS X (v10.10.5).

It has not been tested in any other environments or with other versions of the 
software. 

## Install

Install this package globally:

    npm install -g psproxy
    
## Usage

Apply the current proxy settings to Pulse Secure:

    sudo psproxy on

Remove the current proxy settings from Pulse Secure:

    sudo psproxy off
    
## How Does it Work?

[`scutil`][3] is used to to apply proxy settings to Pulse Secure

View the [bin/psproxy.sh][4] file for the specifics.

[1]: http://www.charlesproxy.com/
[2]: https://www.pulsesecure.net/
[3]: https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/scutil.8.html
[4]: https://github.com/majgis/psproxy/blob/master/bin/psproxy.sh