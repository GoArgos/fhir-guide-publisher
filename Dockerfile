FROM openjdk:9

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            git \
            ant \
            jekyll \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /guide \
    && mkdir /guide/output

COPY . /publisher
WORKDIR /publisher

ENTRYPOINT /publisher/pub.sh
