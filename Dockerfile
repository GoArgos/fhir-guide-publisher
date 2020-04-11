FROM adoptopenjdk/openjdk8

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
            software-properties-common \
            git \
            ant \
            wget \
            jekyll \
    && rm -rf /var/lib/apt/lists/*

COPY . /publisher
WORKDIR /publisher

CMD ["/publisher/pub_menu.sh"]
