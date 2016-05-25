#!/bin/bash

#install wget
Wget=$(which wget)
if [[ -z ${Wget} ]]; then
   echo "wget installation"
   sudo apt-get install -y wget
fi
if [[ ! -f  tools-install.sh ]]; then
  wget https://github.com/WorkflowCenter-Repositories/ToolsInstallationScripts/raw/master/tools-install.sh
  chmod u+x tools-install.sh
fi

. ./tools-install.sh

sudo service docker start

  echo "deploy the workflow"
   if [[ -d ~/ImportDile ]]; then
      echo "previous workflow execution exists and will be deleted"
      rm -r ~/ImportDile 
   fi
  cfy local init --install-plugins -p ImportDile.yaml --input input.yaml

cfy local execute -w install

echo "your output files are in ~/ImportFile folder"
