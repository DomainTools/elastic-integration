DomainTools Elastic Integration

### Includes

- kibana plugin (via zip file)
- deployment/install necessities
- logstash config templates customer can use


### Install Background Service

	/bin/bash -c “$(curl -fsSL https://github.com/DomainTools/elastic-integration/raw/main/install.sh)”

### Install Kibana Plugin

- assuming your kibana install is located at /usr/share/kibana

	/usr/share/kibana/bin/kibana-plugin install https://github.com/DomainTools/elastic-integration/raw/main/domaintools7.5.2-[current version].zip
