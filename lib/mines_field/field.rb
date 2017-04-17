module MinesField
  class Field
    attr_reader :mines

    def initialize(mines, index)
      @mines = mines
      mines[index].detonate
    end

    def self.total_explosions(mines)
      mines.size.times do |index|
        explosions = new(mines, index).explode_mines
        puts "mine ##{index}: explosions #{explosions}"
      end
    end

    def explode_mines
      detonate_activated_mines while detonated_mines.any?
      exploded_mines.size - 1
    ensure
      mines.each(&:reload)
    end

    private

    def detonate_activated_mines
      detonated_mines.each do |detonated_mine|
        detonated_mine.explode
        explode_detonated_mines(detonated_mine)
      end
    end

    def explode_detonated_mines(detonated_mine)
      activated_mines.each do |activated_mine|
        activated_mine.detonate if activated_mine.detonate?(detonated_mine)
      end
    end

    # activated_mines; detonated_mines; exploded_mines
    %i[activated detonated exploded].each do |state|
      define_method("#{state}_mines") do
        mines.select { |mine| mine.public_send("#{state}?") }
      end
    end
  end
end
