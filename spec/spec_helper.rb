begin
  require 'bundler'
rescue LoadError => e
  require 'rubygems'
  require 'bundler'
end
Bundler.setup :test
Bundler.require

require File.expand_path '../../lib/phony', __FILE__

require 'spec_helper_extensions'
include SpecHelperExtensions