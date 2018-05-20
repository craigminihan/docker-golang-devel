#!/usr/bin/env bash

. ./tag.sh

docker build -t $TAG .
