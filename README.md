# fhir-guide-publisher

A Docker image to run the HL7 FHIR IG Publisher.

(Now based on Logica's FHIR IG Base Image.)

### Use:

Run from the root directory of the IG repo ...

```
docker run -it --rm --name=fhir \
  -v $(pwd):/guide \
  havnfun/fhir-guide-publisher
```

A menu will be displayed:

```
1) Run IG Publisher
2) Shell
3) Quit
```
