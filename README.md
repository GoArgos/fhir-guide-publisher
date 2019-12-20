# fhir-guide-publisher

A Docker image to run the HL7 FHIR IG Publisher.

### Use:
```
docker run -it --rm --name=fhir \
  -v /local/path/to/CA-Scratch:/guide \
  havnfun/fhir-guide-publisher
```

A menu will be displayed:

1) Run IG Publisher
2) Quit
