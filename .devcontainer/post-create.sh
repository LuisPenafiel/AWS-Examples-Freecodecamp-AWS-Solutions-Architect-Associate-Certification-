#!/bin/bash

set -e

echo "== Running install-aws-cli.sh"
if ! /bin/bash .devcontainer/install-aws-cli.sh; then
  echo "Error running install-aws-cli.sh"
  exit 1
fi

echo "== Running install-terraform.sh"
if ! /bin/bash .devcontainer/install-terraform.sh; then
  echo "Error running install-terraform.sh"
  exit 1
fi

echo "== Running setup.sh"
if ! /bin/bash .devcontainer/setup.sh; then
  echo "Error running setup.sh"
  exit 1
fi

