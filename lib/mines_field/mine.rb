module MinesField
  class Mine < Struct.new(:x, :y, :radius)
    state_machine :state, initial: :enabled do
      event :activate do
        transition enabled: :activated
      end

      event :detonate do
        transition activated: :detonated
      end

      event :reload do
        transition any => :enabled
      end
    end

    def activate?(mine)
      distance(mine) <= mine.radius
    end

    private

    def distance(mine)
      Math.sqrt((x - mine.x)**2 + (y - mine.y)**2)
    end
  end
end
