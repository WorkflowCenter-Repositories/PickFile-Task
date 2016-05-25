#!/bin/bash

set -e
blueprint=$1

ctx logger info "cleaning"

chmod 777 ~/${blueprint}/

rm -r ~/${blueprint}/importFile

rm ~/${blueprint}/${blueprint}.yaml

ctx logger info "Deleting ${container}"

sudo docker rm -f megaNJ





