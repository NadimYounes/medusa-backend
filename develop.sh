#!/bin/bash

medusa migrations run

npx @medusajs/medusa-cli@latest seed -f ./data/seed.json

yarn dev
