# Stream in Docker

A docker image for steam based on Ubuntu.

## Tested System Environment

1. Ubuntu 18.04 amd64 with nvidia GTX-1650. (docker)
2. Ubuntu 20.04 amd64 with intel 17-10510U. (docker, podman)

## System Resuirement

1. nvidia graphic card (or intel CPU).
1. pulseaudio audio server.

## How to use it?

1. Install Docker/Podman
1. Clone this repository.

```
$ git clone --depth 1 -b master https://github.com/karta0807913/Docker-Steam.git
```

3. Run `start` script

```
$ ./start
```

4. Wait until it start.

## Notice

* steam data stores in `"$PROJECT_HOME/steam"`.
