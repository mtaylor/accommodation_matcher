source "http://rubygems.org"

gem "mongoid", "~> 3.0.0"

# The standard yajl-ruby parser has no support for triggering events when
# nested objects are found.  This would result in loading the entire json file
# into memory.  This fork of the project adds nested object triggering.
gem 'yajl-ruby', :git => 'git://github.com/hoxworth/yajl-ruby.git'

group :test do
  gem "rspec"
  gem "factory_girl"
  gem "database_cleaner"
end
