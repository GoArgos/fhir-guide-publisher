# fhir-guide-publisher

Docker image containing tools used to publish CA-Scratch.

### Use:
```
docker run -it --name=fhir \
  -v /local/path/to/CA-Scratch:/guide \
  havnfun/fhir-guide-publisher
```

A menu will be displayed:

1) Run IG Publisher
2) Other Stuff
3) Quit
