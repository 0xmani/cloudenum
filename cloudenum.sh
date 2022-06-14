#!/bin/bash

while read -r i;do
	dig $i > cloudassets/$i.test.txt; cat cloudassets/$i.test.txt|grep "ANSWER SECTION" -A 3 |sed 's/;; ANSWER SECTION://g'|grep "aws" |tee cloudassets/$i.awscloud.txt;
	cat cloudassets/$i.test.txt|grep "ANSWER SECTION" -A 3 |sed 's/;; ANSWER SECTION://g'|grep "google" |tee cloudassets/$i.googlecloud.txt;
	cat cloudassets/$i.test.txt|grep "ANSWER SECTION" -A 3 |sed 's/;; ANSWER SECTION://g'|grep "azure" |tee cloudassets/$i.azurecloud.txt; 
	rm cloudassets/$i.test.txt;
	[ -s cloudassets/$i.awscloud.txt ] && echo $i || rm cloudassets/$i.awscloud.txt;
	[ -s cloudassets/$i.azurecloud.txt ] && echo $i || rm cloudassets/$i.azurecloud.txt;
	[ -s cloudassets/$i.googlecloud.txt ] && echo $i || rm cloudassets/$i.googlecloud.txt;
done <  $1
