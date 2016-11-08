# psproxy

A simple way to toggle the proxy settings for Pulse Secure VPN.

This utility was created to solve the problem of [Charles Proxy][1](v3.10.2) not 
working when connected to a VPN using [Pulse Secure][2](v5.2.5) on 
Mac OS X (v10.10.5).

This tool is not intended to work on operating systems other than 
Mac OS X, and has only been tested with the configuration above.

A notable change is that v2.x of this tool now supports the newer 
version of Pulse Secure.  Install v1.x if you have the older
**Junos Pulse Secure**.


## Install

Install this package globally:

    npm i -g psproxy
    
    
## Usage
Before executing this utility, make sure the following is in order

1. Pulse Secure is securely connected to your VPN
1. Your proxy (ie. Charles) is running

Apply the current proxy settings to Pulse Secure:

    sudo psproxy on

Remove the current proxy settings from Pulse Secure:

    sudo psproxy off


## Troubleshooting

If you see one of the following error messages, follow the provided instructions
to resolve the issue.

**Command Line:**

* **No such key**
    * Pulse Secure must be both running and securely connected to the VPN
    * Use v1.x of this tool with Junos Pulse Secure
    * Use v2.x of this tool with Pulse Secure

* **Permission denied**
    * Admin privileges are required, use `sudo`.
    
**Browser:**

* **Unable to connect to the proxy server (ERR_PROXY_CONNECTION_FAILED)**
    * You closed your proxy (ie. Charles).  Either restart your proxy or 
    execute `sudo psproxy off`

## How Does it Work?

[`scutil`][3] is used to apply proxy settings to Pulse Secure.

View the [bin/psproxy.sh][4] file for the specifics.


## References

1. [GitHub - mivasi/CharlesJuniperVPN][5]


[1]: http://www.charlesproxy.com/
[2]: https://www.pulsesecure.net/
[3]: https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man8/scutil.8.html
[4]: https://github.com/majgis/psproxy/blob/master/bin/psproxy.sh
[5]: https://gist.github.com/mivasi/bc0046aa2277a64726c8

