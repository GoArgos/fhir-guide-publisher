# fhir-guide-publisher

Docker image containing tools used to publish CA-Scratch.

### Use:
```
docker run -it --name=fhir \
  -v /local/path/to/CA-Scratch:/guide
  -v /local/path/to/CA-Scratch-YAML:/yaml
  havnfun/fhir-guide-publisher
```

A menu will be displayed:

1) Pull FHIR Resource from HL7 for editing (in YAML)
2) Push Resources (YAML) to guide (as JSON)
3) Publish Guide
4) Quit
