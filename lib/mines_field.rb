require 'state_machines'
require 'mines_field/version'
require 'mines_field/mine'
require 'mines_field/field'

module MinesField
  extend self

  def run
    mines = ARGF.inject([]) do |coll, line|
      args = line.split.map(&:to_i)
      coll << Mine.new(*args)
    end

    MinesField::Field.explode_mines(mines)
  end
end
