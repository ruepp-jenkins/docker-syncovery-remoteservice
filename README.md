# Project

Github: https://github.com/MyUncleSam/docker-syncovery-remoteservice

Docker: https://hub.docker.com/repository/docker/stefanruepp/syncoveryremote

# License

MIT License

Copyright (c) 2024 Stefan Ruepp https://github.com/MyUncleSam/docker-syncovery-remoteservice

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

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
