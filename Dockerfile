FROM jekyll/jekyll

RUN apk --no-cache add \
            wget \
            curl

COPY . /publisher
WORKDIR /publisher

CMD ["/publisher/pub_menu.sh"]
