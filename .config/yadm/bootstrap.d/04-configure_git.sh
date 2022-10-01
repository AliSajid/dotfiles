#!/bin/bash

set -euo pipefail

echo "Configuring Git"

echo "Setting gp as the git credential helper"
git config --global credential.helper "/usr/bin/gp credential-helper"