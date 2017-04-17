module MinesField
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
