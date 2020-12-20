FROM logicahealth/fhir-ig-base:latest

COPY . /publisher
WORKDIR /publisher

CMD ["/publisher/pub_menu.sh"]
