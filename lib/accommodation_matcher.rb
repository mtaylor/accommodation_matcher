require "mongoid"

#  Load Mongoid Config
Mongoid.load!(File.join(File.dirname(__FILE__), '../config/', 'mongoid.yml'), :development)

require File.join(File.dirname(__FILE__), 'accommodation_matcher/', 'accommodation')
require File.join(File.dirname(__FILE__), 'accommodation_matcher/', 'traveller')
require File.join(File.dirname(__FILE__), 'accommodation_matcher/', 'price_range')
require File.join(File.dirname(__FILE__), 'accommodation_matcher/', 'capacity')