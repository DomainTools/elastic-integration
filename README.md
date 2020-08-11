DomainTools Elastic Integration

### Includes

- kibana plugin (via zip file)
- deployment/install necessities
- logstash config templates customer can use

### Recommended Start Up Order

1. Elasticsearch
1. Logstash
1. Setup Logstash config
1. Filebeat
1. Setup Filebeat config
1. Filebeat
1. DomainTools Backend Python Service (Docker)
1. Kibana with DomainTools plugin

### Install Background Service

```bash
/bin/bash -c “$(curl -fsSL https://github.com/DomainTools/elastic-integration/raw/main/install.sh)”
```

If you don't have a `.env` file yet, this will create one from `.env.example` and notify you to edit it and retry `make install`

### Install Kibana Plugin

- assuming your kibana install is located at /usr/share/kibana

```bash
/usr/share/kibana/bin/kibana-plugin install https://github.com/DomainTools/elastic-integration/raw/main/domaintools[elastic-version]-[current version].zip
```

# TESTING LOGSTASH

To test and verify logstash config files run:

`/usr/share/logstash/bin/logstash -f logstash_test.conf --path.settings /etc/logstash -t`

- `/user/share/logstash/bin/logstash` is the logstash executable
- `-f logstash_test.conf` is the flag to point to the config file
- `--path.settings /etc/logstash` is the flag to point to the directory holding the logstash.yml file
- `-t` is the flag to test the config 

# Notes for Customer:

#### Out of band deletion of indices may cause problems

*Solution:* restart dt_service_1 python background docker container to recreate indices

# Troubleshooting

#### Problem: Test connection errors

*Solution:*
- Can kibana talk to python service?
- Are the DomainTools API credentials correct?

#### Problem: Data not being enriched

*Solution:*
- Make sure the field in logstash is being extracted correctly
- Make sure service url is pointing to the service

