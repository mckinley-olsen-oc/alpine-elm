FROM alpine:3.6

RUN mkdir /elm
WORKDIR /elm
RUN apk update && \
    apk add ca-certificates && \
    apk add wget && \
    apk add gmp && \
    wget https://dl.bintray.com/elmlang/elm-platform/0.18.0/linux-x64.tar.gz && \
    tar xvzf linux-x64.tar.gz

ENV PATH="/elm/dist_binaries:${PATH}"

CMD ["/bin/sh"]
