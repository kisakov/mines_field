module MinesField
  class Mine < Struct.new(:x, :y, :radius)
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
      distance(mine) <= mine.radius
    end

    private

    # Euclidean distance for Two dimensions
    def distance(mine)
      Math.sqrt((x - mine.x)**2 + (y - mine.y)**2)
    end
  end
end
