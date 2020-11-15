FROM openjdk:11

RUN apt-get update; \
	apt-get install -y --no-install-recommends \
		ruby-full \
		jekyll
 
COPY . /publisher
WORKDIR /publisher

CMD ["/publisher/pub_menu.sh"]
