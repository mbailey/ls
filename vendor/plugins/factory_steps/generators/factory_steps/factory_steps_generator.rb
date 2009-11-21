require 'factory_steps'

class FactoryStepsGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      m.directory 'features/step_definitions'
      m.directory 'features/support'
      m.template 'factory_steps.erb', 'features/step_definitions/factory_steps.rb'
      m.template 'factory_steps_helpers.erb', 'features/support/factory_steps_helpers.rb'
    end
  end

end
