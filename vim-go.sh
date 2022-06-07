#!/bin/bash
docker pull tafkaks/vim-go:latest
docker rm vim-go
docker run -it -v `pwd`:/app -v/var/run/docker.sock:/var/run/docker.sock --name vim-go \
     tafkaks/vim-go:latest $@
sudo chown -R $USER:$USER .
