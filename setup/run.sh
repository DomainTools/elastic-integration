#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"
SCRIPT_FULL_PATHS=$(ls -lrt -d -1 $DIR/* | grep -v 'run.sh')

# reset scripts to source controlled version so we know the template text to change
echo $SCRIPT_FULL_PATHS | xargs git checkout

# get user input to replace template text in scripts
read -p "Logstash alias name: [dt-alias]" LOGSTASH_ALIAS
LOGSTASH_ALIAS=${LOGSTASH_ALIAS:-dt-alias}
read -p "Elasticsearch protocol: [http]" ES_PROTOCOL
ES_PROTOCOL=${ES_PROTOCOL:-http}
read -p "Elasticsearch host: [localhost]" ES_HOST
ES_HOST=${ES_HOST:-localhost}
read -p "Elasticsearch port: [8200]" ES_PORT
ES_PORT=${ES_PORT:-8200}
read -p "Elasticsearch username: " ES_USERNAME
[[ -z "$ES_USERNAME" ]] && { echo "Elasticsearch username is required"; exit 1; }
read -p "Elasticsearch password: " ES_PASSWORD
[[ -z "$ES_PASSWORD" ]] && { echo "Elasticsearch password is required"; exit 1; }

# base64 encode elasticsearch username and password for curl calls in scripts
CREDS=$(echo -n "$ES_USERNAME:$ES_PASSWORD" | openssl base64)

# Ask user if they are ready to proceed
read -p "Input gathered, ready to proceed? [Y/n]" PROCEED

if [[ "$PROCEED" != 'n' ]]
then
	echo "replacing template text with user input"
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		echo $SCRIPT_FULL_PATHS | xargs sed -i "s/dt-alias/$LOGSTASH_ALIAS/g"
		echo $SCRIPT_FULL_PATHS | xargs sed -i "s/ES_PROTOCOL/$ES_PROTOCOL/g"
		echo $SCRIPT_FULL_PATHS | xargs sed -i "s/ES_HOST/$ES_HOST/g"
		echo $SCRIPT_FULL_PATHS | xargs sed -i "s/ES_PORT/$ES_PORT/g"
		echo $SCRIPT_FULL_PATHS | xargs sed -i "s/YOUR_BASE64_ENCODED_AUTH/$CREDS/g"
	elif [[ "$OSTYPE" == "darwin"* ]]; then
		echo $SCRIPT_FULL_PATHS | xargs sed -i '' -e "s/dt-alias/$LOGSTASH_ALIAS/g"
		echo $SCRIPT_FULL_PATHS | xargs sed -i '' -e "s/ES_PROTOCOL/$ES_PROTOCOL/g"
		echo $SCRIPT_FULL_PATHS | xargs sed -i '' -e "s/ES_HOST/$ES_HOST/g"
		echo $SCRIPT_FULL_PATHS | xargs sed -i '' -e "s/ES_PORT/$ES_PORT/g"
		echo $SCRIPT_FULL_PATHS | xargs sed -i '' -e "s/YOUR_BASE64_ENCODED_AUTH/$CREDS/g"
	fi
	echo "template text replacement complete, running scripts"
	./01_create_log_source_ilm_policy.sh
	./02_create_log_source_index_template.sh
	./03_create_initial_log_source_index.sh
	echo "scripts run successfully"
fi
