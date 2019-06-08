#!/bin/bash
# $1 = resourceName
# $2 = sourcePath
# $3 = destinationPath


if [ -z "$1" ]; then

  echo
  echo "A simple utility to pull a JSON resource in guide for profiling in YAML."
  echo
  echo "Usage:"
  echo "pull_json_resource_from_guide_to_yaml.sh resourceName [sourcePath] [destinationPath]"
  echo

else

  file_out=$3"structuredefinition-profile-"$1".yaml"

  # pull resource and convert to yaml
  file_in=$2"structuredefinition-profile-"$1".json"

  echo
  echo Generating $file_out from temp

  # # header
  echo "# Generated from $file_in on $(date +%Y-%m-%d)" > $file_out
  echo "---" >> $file_out

  # resource metadata
  yq r $file_in >> $file_out

  # # create empty intro file
  # intro=$2"profile-$1-intro.md"
  # echo
  # echo Generating $intro
  #
  # echo "<!--- Text entered into this file will appear at the top of the profiles page before the Formal Views of the profile content. -->" > $intro
  # echo >> $intro
  # echo "Key differences from [USCoreR4 $base_profile](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-$1.html):" >> $intro
  # echo "- *add notes here*" >> $intro
  #
fi
echo
