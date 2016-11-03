#!/bin/bash

bundle exec rake ts:configure ts:index

exec bundle exec rake ts:start
