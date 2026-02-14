#!/bin/bash
lynis audit system --quick --cronjob --exclude-tests "CIS-1.1.1"
