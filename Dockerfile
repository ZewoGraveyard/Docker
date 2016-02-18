FROM swiftdocker/swift

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update; apt-get install -y libssl-dev

RUN mkdir /deps
WORKDIR /deps

ENV ZEWO_VERSION=0.2.0

RUN git clone https://github.com/Zewo/libvenice.git && \
    git clone https://github.com/Zewo/uri_parser.git && \
    git clone https://github.com/Zewo/http_parser.git

RUN for d in ./*/ ; do (cd "$d" && git checkout tags/$ZEWO_VERSION && make && make install); done

WORKDIR /
