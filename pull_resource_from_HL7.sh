#!/bin/bash
# $1 = resourceName
# $2 = destinationPath


if [ -z "$1" ]; then

  echo
  echo "A simple utility to pull down HL7 FHIR resources for profiling in YAML."
  echo
  echo "Usage:"
  echo "pull_resource_from_HL7.sh resourceName [destinationPath]"
  echo

else

  file_out=$2"structuredefinition-profile-"$1".yaml"

  # pull resource from HL7 website
  urn_in="http://www.hl7.org/fhir/"$1".profile.json"
  echo
  echo Pulling $urn_in to temp

  curl $urn_in | yq r - > temp
  base_profile=$(yq r temp type) # capitalized
  echo
  echo Generating $file_out from temp

  # # header
  echo "# Base $base_profile Profile generated from HL7 snapshot:" > $file_out
  echo "# $urn_in" >> $file_out
  echo "# on $(date +%Y-%m-%d)" >> $file_out
  echo "---" >> $file_out

  # resource metadata
  yq n resourceType StructureDefinition >> $file_out
  yq n id "profile-"$1 >> $file_out #typically not capitalized
  yq n url "http://hl7.org/fhir/ca/core/structuredefinition/profile-"$1 >> $file_out
  yq n version "0.0.0" >> $file_out
  yq n name $base_profile"_Profile" >> $file_out
  yq n title $base_profile" Profile" >> $file_out
  yq n status draft >> $file_out
  yq n date $(date +%Y-%m-%d) >> $file_out
  yq n publisher TBD >> $file_out
  yq n description "Proposed constraints and extensions on the $base_profile Resource.  Generated as a first step toward creating a set of Canadian Core FHIR profiles." >> $file_out
  yq n fhirVersion $(yq r temp fhirVersion) >> $file_out
  yq n kind resource >> $file_out
  yq n abstract false >> $file_out
  yq n type $(yq r temp type) >> $file_out
  yq n baseDefinition $(yq r temp url) >> $file_out
  yq n derivation constraint >> $file_out

  # add differential view
  echo "# Pulled snapshot from FHIR resource to seed Differential view" >> $file_out
  yq r temp snapshot > temp2 && mv temp2 temp
  yq w -i temp element[0].short "$base_profile Profile"
  yq w -i temp element[0].definition "The $base_profile Profile is based upon the core FHIR $base_profile Resource"
  yq p -i temp differential
  # comment out lines so they can be uncommented and constrained
  sed -e '/min/,10000 s/^/#/' temp >> $file_out #1000 is crude, fix?
  rm temp

  # create empty intro file
  intro=$2"profile-$1-intro.md"
  echo
  echo Generating $intro

  echo "<!--- Text entered into this file will appear at the top of the profiles page before the Formal Views of the profile content. -->" > $intro
  echo >> $intro
  echo "This profile was generated from [HL7 StructureDefinition](https://www.hl7.org/fhir/$1.profile.json) on 2019-03-28 and constrained during a review of US Core against Canadian sources." >> $intro
  echo >> $intro
  echo "Key differences from [USCoreR4 $base_profile](https://build.fhir.org/ig/HL7/US-Core-R4/StructureDefinition-us-core-$1.html):" >> $intro
  echo "- *add notes here*" >> $intro

fi
echo
