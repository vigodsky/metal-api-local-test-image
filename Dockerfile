FROM ubuntu:22.04

RUN sed -i "s|http://us.|http://|g" /etc/apt/sources.list

RUN apt clean
RUN apt update

RUN apt-get -y install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release \
        wget \
        make \
        build-essential

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update
RUN chmod a+r /etc/apt/keyrings/docker.gpg
RUN apt-get update

RUN apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

RUN wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
RUN rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz
ENV PATH="${PATH}:/usr/local/go/bin"

RUN git config --global url.ssh://git@github.com/.insteadOf https://github.com/