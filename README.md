# Stream in Docker

A docker image for steam based on Ubuntu.

## Tested System Environment

1. Ubuntu 18.04 amd64 with nvidia GTX-1650.
2. Ubuntu 20.04 amd64 with intel 17-10510U

## System Resuirement

1. nvidia graphic card (or intel CPU).
1. pulseaudio audio server.

## How to use it?

1. Install Docker
1. Clone this repository.

```
$ git clone --depth 1 -b master https://github.com/karta0807913/Docker-Steam.git
```

1. Run `start` script

```
$ ./start
```

1. Wait until it start.

## Notice

* steam data will store in `"$PROJECT_HOME/steam"`.
