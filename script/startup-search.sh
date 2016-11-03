#!/bin/bash

bundle exec rake ts:configure ts:index

exec searchd --nodetach --pidfile --config config/"$RAILS_ENV".sphinx.conf
