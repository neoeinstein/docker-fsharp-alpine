FROM neoeinstein/mono-alpine:4.2.2.30-2
MAINTAINER Marcus Griep <marcus@griep.us>

ENV FSHARP_VERSION 4.0.1.1

RUN apk --no-cache add --virtual build-dependencies wget ca-certificates autoconf libtool pkgconf make automake && \
    mkdir -p /tmp/src && \
    cd /tmp/src && \
    wget --progress=dot:mega https://github.com/fsharp/fsharp/archive/$FSHARP_VERSION.tar.gz && \
    tar xzf $FSHARP_VERSION.tar.gz && \
    cd /tmp/src/fsharp-$FSHARP_VERSION && \
    ./autogen.sh --prefix=/usr --with-gacdir=/usr/lib/mono/gac && \
    make && \
    make install && \
    cd ~ && \
    rm -rf /tmp/src

CMD ["fsharpi"]