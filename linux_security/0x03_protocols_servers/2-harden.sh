#!/bin/bash
find / -type d -perm -002 -exec chmod o-w {} \;
