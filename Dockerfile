FROM jekyll/jekyll

RUN apk --no-cache add \
            wget

COPY . /publisher
WORKDIR /publisher

CMD ["/publisher/pub_menu.sh"]
