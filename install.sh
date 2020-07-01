#!/bin/bash
set -u

wget https://github.com/DomainTools/elastic-integration/raw/main/Makefile
wget https://github.com/DomainTools/elastic-integration/raw/main/.env.template
make install
