# vim, gb, and go 1.12 development environment

This image includes vim with my preferred plugins and vim-go. It is my usual dev environmewnt.

Build the environment with the included dockerfile. Use vim-go.sh to start it. Anny parameters get passed
to vim. The working dir is set to /app and the current host dir is mapped to /app.

The current version is go version is 1.12 -- projects  may not be compileable with gb, so use go to build and gb (or somwthing else)
to get dependencies. The image also icludes a working docker client (the docker socket is mapped in by vim-go.sh)

Note that we keep a copy of the vim-go GoBinaries and just copy them in at build time. 

If the vim-go vim plugin needs new binaries on the next build,
just run this image, reinstall the binaries, copy them into `vim-go-binaries` and run docker-build again.

