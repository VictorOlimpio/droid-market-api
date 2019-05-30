#!/usr/bin/env bash

rake db:create db:migrate
bundle exec puma -C config/puma.rb