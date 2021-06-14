# syncovery remote services
This image containes the syncovery remote service. Feel free to use it. If there are any bugs please let me know.

# support
I am not using this tool so I cannot give any support. Please ask the developer.

# information
https://www.syncovery.com/remoteservice/

# configuration
## environment variables
- SYNCOVERY_HOME=/config
  - folder where the configuration is stored in (inside the container)
- TZ=Europe/Berlin
  - timezone to use

## volumes
- /config
  - path to the config file (see environment variable SYNCOVERY_HOME)

Also you need to mount the folders you wanna use (writable).
