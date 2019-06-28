#!/bin/bash
docker pull docker.hero3d.net/vim-go:latest
docker rm vim-go
docker run -it -v `pwd`:/app -v/var/run/docker.sock:/var/run/docker.sock --name vim-go \
    docker.hero3d.net/vim-go:latest $@
sudo chown -R $USER:$USER .
