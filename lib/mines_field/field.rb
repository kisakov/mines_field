module MinesField
  class Field
    attr_reader :mines, :detonated_mine

    def initialize(mines, mine)
      @mines, @detonated_mine = mines, mine
      detonated_mine.detonate
    end

    def self.total_explosions(mines)
      fields = mines.map do |detonated_mine|
        new(mines, detonated_mine).explode_mines
      end

      fields.sort_by { |result| result[:explosions] }.reverse
    end

    def explode_mines
      detonate_activated_mines while detonated_mines.any?
      { mine: detonated_mine, explosions: exploded_mines.size - 1 }
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
