#!/usr/bin/env bash

set -eu

# Generate one github action for each directory in schemas/*
SCRIPT_PATH=${0%/*}
if [ "$0" != "$SCRIPT_PATH" ] && [ "$SCRIPT_PATH" != "" ]; then
    cd "$SCRIPT_PATH"
    export GH_DIR=$(realpath ../../.github)
    cd ../../schemas # switch current directory to schemas/ as root

fi


# all the schemas dirs
schema_dirs=(*)

for schema in "${schema_dirs[@]}"; do 
    echo "Generating action for $schema"
    xsd_file=`find "$schema/" -type f -name "*.xsd"`
    xml_file=`find "$schema/" -type f -name "*.xml"`
    sed -e "s:DIRECTORY:$schema:g" -e "s:SCHEMAXML:$xml_file:g" -e "s:SCHEMAXSD:$xsd_file:g"  "$GH_DIR/schemas-action-template.yaml" > "$GH_DIR/workflows/schema_$schema.yaml"
done
