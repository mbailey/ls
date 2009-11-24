#!/usr/bin/env ruby

# rename all files using a regex

`find . | grep carer`.split.each do |file|
  puts file.chomp
  new_filename = file.sub('carer', 'carer')
  # puts "#{file} #{new_filename}"
  File.rename file, new_filename
end

