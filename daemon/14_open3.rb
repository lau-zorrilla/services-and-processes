#!/usr/bin/env ruby
# 14_open3.rb

require 'open3'

Open3.popen3('ls -l no_such_directory') { |stdin, stdout, stderr| stderr.read }

