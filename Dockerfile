FROM frolvlad/alpine-glibc

RUN mkdir /elm
WORKDIR /elm
RUN apk update && \
    apk add ca-certificates && \
    apk add wget && \
    apk add gmp && \
    wget https://dl.bintray.com/elmlang/elm-platform/0.18.0/linux-x64.tar.gz && \
    tar xvzf linux-x64.tar.gz

ENV PATH="/elm/dist_binaries:${PATH}"

RUN wget https://raw.githubusercontent.com/elm-lang/elm-lang.org/master/src/examples/hello-world.elm && \
    elm-make --yes hello-world.elm

CMD ["/bin/sh"]
