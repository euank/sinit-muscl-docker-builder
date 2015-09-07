# Tiny sinit Installer

This Dockerfile builds an image that can be used to acquire a small sinit binary.

## Why?

The reason I made this was to make it easier to get a small sinit binary.

If you build `sinit` naively on a standard Linux Distro, you'll end up with a statically linked binary built against libc.

```
$ ls -l sinit
-rwxr-xr-x 1 user group 750920 Sep  6 04:20 sinit
```

See that? Over 700K.. That's unacceptable for a Suckless Tool.

However, the majority of that is because of libc. If you create a dynamically
linked binary instead you'll find a nice clean 8833 byte binary... that
unfortunately can't be executed as an init system meaningfully.

The happy middle ground is to link against musl instead, and that's exactly what this project does.

Running `docker run -v "$(pwd)":/out euank/sinit-installer` will result in a
nice clean 13744 byte statically linked binary that can be used as the init for
a 64-bit Linux of choice.


## Usage

To get a nice small statically linked v1.0 sinit (as compiled by the Dockerhub
automated build machines), simply run `docker run -v "$(pwd)":/out
euank/sinit-installer`.

To compile the latest version of sinit locally, instead run `docker run -v
"$(pwd)":/out euank/sinit-installer master`. You may also pass any other tag or
branch into the first argument for it to be built instead.

## License

UNLICENSE (that is, Public Domain).

I do not own sinit.
