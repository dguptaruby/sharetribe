#!/bin/bash

bundle exec rake ts:configure ts:index

bundle exec rake ts:start

exec sleep 3600
