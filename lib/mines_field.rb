require 'state_machines'
require 'mines_field/version'
require 'mines_field/mine'
require 'mines_field/field'
require 'mines_field/processor'

# There is a field of mines. Each mine is identified by a 2d-coordinate
# and a blast radius.
# When a mine explodes at time interval t, it explodes mines
# that lay within its blast radius at t + 1.
module MinesField
  module_function

  def run
    Processor.run
  end
end
