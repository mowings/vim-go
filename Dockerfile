FROM golang:1.15
LABEL description="golang, gb ad a vim working environment"
MAINTAINER mowings@turbosquid.com
RUN go get github.com/constabulary/gb/...
VOLUME /app
ENV GOPATH=/go:/app:/app/vendor
# Sets up my working env. YMMV
ENV TERM=xterm-256color
RUN apt-get -y update && apt-get -y install git vim wget tmux locales 
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
COPY vimrc /root/.vimrc
COPY setup.sh /root
COPY tmux.conf /root/.tmux.conf
RUN cd /root && ./setup.sh
COPY ./vim-go-binaries/* /go/bin/
RUN apt-get install  -y curl sudo apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - && \
    add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" && \
   apt-get update && \
   apt-get install -y docker-ce-cli
RUN mkdir -p /root/.vim/backups && mkdir -p /root/.vim/tmp
WORKDIR /app
RUN apt-get install -y nodejs npm && npm install -g coffee-script
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
RUN sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
RUN apt-get update && sudo apt-get install -y terraform
ENTRYPOINT ["vim"]
