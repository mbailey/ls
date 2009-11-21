require 'lib/factory_steps'
require 'machinist/object'
require 'erb'

eval ERB.new(IO.read('generators/factory_steps/templates/factory_steps.erb')).result
eval ERB.new(IO.read('generators/factory_steps/templates/factory_steps_helpers.erb')).result
