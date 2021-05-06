et -eu

# Generate one github action for each directory in schemas/*
SCRIPT_PATH=${0%/*}
if [ "$0" != "$SCRIPT_PATH" ] && [ "$SCRIPT_PATH" != "" ]; then
    cd "$SCRIPT_PATH"
    export GH_DIR=$(realpath ../../.github)
    cd ../../schemas # switch current directory to schemas/ as root
fi

humanize_name() 
{
    # Replace underscore with space
    # Change case of first letter to uppercase
    arr=($(echo $1 | tr "_" " "))
    for i in "${!arr[@]}"; do
        if (("${#arr[$i]} > 2")); then
            arr[$i]=${arr[$i]^}
        fi
    done
    echo "${arr[@]}"
}


# all the schemas dirs
schema_dirs=(*)
# reset the readme file from template
cat $GH_DIR/schemas-readme.template > readme.md
for schema in "${schema_dirs[@]}"; do
    if [ -d $schema ]; then
        echo "Adding entry for $schema in readme.md"
        xsd_file=`find "$schema/" -type f -name "*.xsd"`
        xml_file=`find "$schema/" -type f -name "*.xml"`
        name=`humanize_name $schema`
	status=$(echo -n "[![$name](https://github.com/Sahamati/account-aggregator-standards/actions/workflows/schema_$schema.yaml/badge.svg)](https://github.com/Sahamati/account-aggregator-standards/actions/workflows/schema_$schema.yaml)")
        echo "$name | [${xsd_file//$schema\//}]($xsd_file) | [${xml_file//$schema\//}]($xml_file) | $status" >> readme.md
    fi
done
