#!/bin/bash -e

fly -t local set-pipeline -p backup-mx -c ci/pipeline.yml \
  -v "deploy-key=$(cat ../sublimia-platform/secrets/deploy_keys/sublimia-backup-mx)" \
  -v "dockerhub-password=$(lpass show --password docker.com)" \
  -v "hyper-sh-access-key=$(lpass show --notes secrets | yq -r '."hyper-sh-access-key"')" \
  -v "hyper-sh-secret-key=$(lpass show --notes secrets | yq -r '."hyper-sh-secret-key"')"


