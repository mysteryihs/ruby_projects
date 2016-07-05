class Board
	attr_reader :board
	def initialize(pos)
		@board = []
		x = (0..7).to_a
		y = (0..7).to_a
		x.each do |numberx|
			y.each do |numbery|
				@board << [numberx, numbery]
			end
		end
		@knight = Knight.new(pos)
		puts "Knight initialized at #{@knight.pos}"
	end

	def valid_moves(current_knight)
		current = current_knight.pos
		moves = []
			moves << Knight.new([current[0] + 1, current[1] + 2], current_knight) if @board.include? [current[0] + 1, current[1] + 2]
			moves << Knight.new([current[0] + 2, current[1] + 1], current_knight) if @board.include? [current[0] + 2, current[1] + 1]
			moves << Knight.new([current[0] + 2, current[1] - 1], current_knight) if @board.include? [current[0] + 2, current[1] - 1]
			moves << Knight.new([current[0] + 1, current[1] - 2], current_knight) if @board.include? [current[0] + 1, current[1] - 2]
			moves << Knight.new([current[0] - 1, current[1] - 2], current_knight) if @board.include? [current[0] - 1, current[1] - 2]
			moves << Knight.new([current[0] - 2, current[1] - 1], current_knight) if @board.include? [current[0] - 2, current[1] - 1]
			moves << Knight.new([current[0] - 2, current[1] + 1], current_knight) if @board.include? [current[0] - 2, current[1] + 1]
			moves << Knight.new([current[0] - 1, current[1] + 2], current_knight) if @board.include? [current[0] - 1, current[1] + 2]
		return moves
	end

	def travail(final_pos)
		queue = []
		queue << @knight #first pos
		while queue != queue.empty?
			current = queue.shift
			return current if current.pos == final_pos
			valid_moves(current).each {|move| queue << move}
		end
	end

	def return_moves(final_pos)
		return puts "Invalid position. Choose a coordinate from [0,0] to [7,7]" if !@board.include? final_pos
		final_pos = travail(final_pos)
		route = []
		route.unshift(final_pos)
		current = final_pos.parent
		until current == nil
			route.unshift(current)
			current = current.parent
		end
		route.collect! {|move| move.pos}
	end

	class Knight
		attr_accessor :pos, :parent
		def initialize(pos, parent = nil)
			@pos = pos
			@parent = parent
		end
	end
end

a = Board.new([7,7])
print a.return_moves([7,0])