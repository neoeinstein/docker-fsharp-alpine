[![Docker Stars](https://img.shields.io/docker/stars/neoeinstein/fsharp-alpine.svg?style=flat-square)](https://hub.docker.com/r/neoeinstein/fsharp-alpine/)
[![Docker Pulls](https://img.shields.io/docker/pulls/neoeinstein/fsharp-alpine.svg?style=flat-square)](https://hub.docker.com/r/neoeinstein/fsharp-alpine/)

Mono (F#) Docker image
======================

This image is based on Alpine Linux image, which is only a 5MB image, and contains
[Mono](http://www.mono-project.com/) as well as the F# compiler and interpreter.

This image is sourced from the [Mono docker image](https://hub.docker.com/r/neoeinstein/mono-alpine/).

WARNING: That Mono image was compiled for Arch Linux and is ported to Alpine via
[glibc hack](https://github.com/gliderlabs/docker-alpine/issues/11)! It is being used
because the current Mono package for Alpine Linux (based on musl instead of glibc)
generates a segfault when bootstrapping the F# compiler.

Total size of this image is only:
[![](https://badge.imagelayers.io/neoeinstein/mono-alpine:latest.svg)](https://imagelayers.io/?images=neoeinstein/fsharp-alpine:latest 'Get your own badge on imagelayers.io')


Usage Example
-------------

By default, the image will open the F# Interpreter and await input.

```bash
$ docker run -i -t neoeinstein/fsharp-alpine
```

You can also invoke the interpreter to execute a file:

```bash
$ echo 'let img = "Alpine Linux" in printfn "Hello World from fsharpi on %s" img' > qq.fsi
$ docker run --rm -v "$(pwd)":/mnt neoeinstein/fsharp-alpine fsharpi --exec /mnt/qq.fsi
```

That same file can be compiled into an executable and run:
```bash
$ echo 'let img = "Alpine Linux" in printfn "Hello World from fsharpi on %s" img' > qq.fs
$ docker run --rm -v "$(pwd)":/mnt neoeinstein/fsharp-alpine sh -c "fsharpc -out:/mnt/qq.exe /mnt/qq.fs && mono /mnt/qq.exe"
```
