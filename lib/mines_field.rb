require 'state_machines'
require 'mines_field/version'
require 'mines_field/mine'
require 'mines_field/field'
require 'mines_field/processor'

# TODO
module MinesField
  module_function

  def run
    Processor.run
  end
end
