#!/bin/bash
find / -xdev  -type d -perm -002 -exec chmod o-w {} \;
