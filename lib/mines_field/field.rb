module MinesField
  class Field
    attr_reader :mines

    def initialize(mines, index)
      @mines = mines
      mines[index].activate
    end

    def self.explode_mines(mines)
      [].tap do |result|
        mines.size.times do |index|
          explosions = new(mines, index).explode_mines
          result << explosions
          puts "mine ##{index}: explosions #{explosions}"
        end
      end
    end

    %i[enabled activated detonated].each do |state|
      define_method("#{state}_mines") do
        mines.select { |mine| mine.public_send("#{state}?") }
      end
    end

    def explode_mines
      while activated_mines.any? do
        activated_mines.each do |activated_mine|
          activated_mine.detonate

          enabled_mines.each do |enabled_mine|
            enabled_mine.activate if enabled_mine.activate?(activated_mine)
          end
        end
      end

      detonated_mines.size - 1
    ensure
      mines.each(&:reload)
    end
  end
end
