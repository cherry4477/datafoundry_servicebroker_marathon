FROM golang:1.5.3

ENV BROKERPORT 8000
EXPOSE 8000

ENV TIME_ZONE=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone

#ENV GOPATH=/xxxxx/
COPY . /usr/local/go/src/github.com/asiainfoLDP/datafoundry_servicebroker_marathon

WORKDIR /usr/local/go/src/github.com/asiainfoLDP/datafoundry_servicebroker_marathon

RUN go get github.com/tools/godep \
    && godep go build 

CMD ["sh", "-c", "./datafoundry_servicebroker_marathon"]