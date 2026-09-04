#!/bin/bash

set -e

curl -fsSL https://bun.sh/install | BUN_INSTALL="$(pwd)/.bun-1.4.0" bash -s "bun-v1.4.0"
