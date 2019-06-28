FROM golang:1.12
LABEL description="golang, gb ad a vim working environment"
MAINTAINER mowings@turbosquid.com
RUN go get github.com/constabulary/gb/...
VOLUME /app
ENV GOPATH=/go:/app:/app/vendor
# Sets up my working env. YMMV
ENV TERM=xterm-256color
RUN apt-get -y update && apt-get -y install git vim wget tmux locales 
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
RUN cd /root && wget -q -O - https://gist.githubusercontent.com/mowings/1832c5acea6084e84ed9051edca42c36/raw/d51fda6b46f19fca603680368fe78756a5ae9395/setup.sh | /bin/bash
RUN cd /root && wget -q https://gist.githubusercontent.com/mowings/1832c5acea6084e84ed9051edca42c36/raw/d51fda6b46f19fca603680368fe78756a5ae9395/.vimrc
RUN cd /root && wget -q https://gist.githubusercontent.com/mowings/1832c5acea6084e84ed9051edca42c36/raw/d51fda6b46f19fca603680368fe78756a5ae9395/.tmux.conf
RUN echo >> /root/.vimrc && echo "set t_ut=" >> /root/.vimrc
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
WORKDIR /app
ENTRYPOINT ["vim"]
