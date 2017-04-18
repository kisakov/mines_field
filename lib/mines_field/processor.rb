module MinesField
  # stdin - the list of strings that contain mines with it's X & Y coordinates
  #         and blast radius (ex "2 2 5")
  # stout - the list of strings that contain mines with it's parameters
  #         and total number of explosions generated by this mine (ex 2 2 5 9).
  # The mine that generated explosion is not counted in the total number
  # of explosions.
  # Result is sorted in the descending order of total generated explosions.
  class Processor
    class << self
      def run
        MinesField::Field.total_explosions(fetch_mines).each do |result|
          puts "#{result[:mine]} #{result[:explosions]}"
        end
      end

      private

      def fetch_mines
        ARGF.inject([]) do |mines, line|
          args = line.split.map(&:to_i)
          mines << Mine.new(*args)
        end
      end
    end
  end
end
