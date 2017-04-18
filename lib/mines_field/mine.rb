module MinesField
  # Represents mine with it's three input arguments:
  # x, y coordinates and blast radius.
  #
  # Mine can be it one of three states:
  # activated - default state of each mine.
  # detonated - the state when mine was "detonated", but not "exploded" yet.
  # exploded - after mine was "detonated", it's next state is "exploded".
  # Other activated mines that were in the blast radius of an "exploded" mine become "detonated".
  class Mine < Struct.new(:x, :y, :blast_radius)
    state_machine :state, initial: :activated do
      event :detonate do
        transition activated: :detonated
      end

      event :explode do
        transition detonated: :exploded
      end

      event :reload do
        transition any => :activated
      end
    end

    def detonate?(mine)
      distance(mine) <= mine.blast_radius
    end

    def to_s
      [x, y, blast_radius].join(' ')
    end

    private

    # Euclidean distance for Two dimensions
    def distance(mine)
      Math.sqrt((x - mine.x)**2 + (y - mine.y)**2)
    end
  end
end
