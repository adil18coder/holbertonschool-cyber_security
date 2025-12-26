#!/bin/bash
whois "$1"|awk '/^(Registrant|Admin|Tech)/{s=$1}/ (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone|Email):/{f=$2;gsub(":","",f);print s" "f","substr($0,index($0,$3))(f=="Street"?" ":"")}/ Phone Ext:/{print s" Phone Ext:,"}/ Fax/{print s" "$2","}/ Fax Ext:/{print s" Fax Ext:,"}' >"$1.csv"

