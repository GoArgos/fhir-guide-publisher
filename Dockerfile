FROM adoptopenjdk/openjdk8

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
            software-properties-common \
            git \
            ant \
            jekyll \
            python-pip

RUN add-apt-repository ppa:rmescandon/yq && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
            yq

RUN rm -rf /var/lib/apt/lists/* \
    && mkdir /guide \
    && mkdir /yaml

RUN pip install --upgrade setuptools \
    && pip install python-json2yaml jsonschema

COPY . /publisher
WORKDIR /publisher

CMD ["/publisher/pub_menu.sh"]
