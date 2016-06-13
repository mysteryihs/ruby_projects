class TicTacToe
	def initialize(player1, player2)
		@board = Board.new
		@player1 = Player.new(player1)
		@player2 = Player.new(player2)
		make_move
	end

	def display
		puts @board.top_row.join
		puts @board.mid_row.join
		puts @board.bottom_row.join
	end

	def update(x_or_o)
		input = gets.chomp
		case input.downcase
		when 'tr'
			if @board.top_row[2] == '-'
				@board.top_row[2] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		when 'tm'
			if @board.top_row[1] == '-'
				@board.top_row[1] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		when 'tl'
			if @board.top_row[0] == '-'
				@board.top_row[0] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		when 'mr'
			if @board.mid_row[2] == '-'
				@board.mid_row[2] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		when 'mm'
			if @board.mid_row[1] == '-'
				@board.mid_row[1] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		when 'ml'
			if @board.mid_row[0] == '-'
				@board.mid_row[0] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		when 'br'
			if @board.bottom_row[2] == '-'
				@board.bottom_row[2] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		when 'bm'
			if @board.bottom_row[1] == '-'
				@board.bottom_row[1] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		when 'bl'
			if @board.bottom_row[0] == '-'
				@board.bottom_row[0] = x_or_o
			else
				puts 'Invalid play: Try again'
				update(x_or_o)
			end
		else
			puts 'Invalid play: Try again'
			self.display
			update(x_or_o)
		end
	end

	def make_move
		puts 'Valid choices: tr, tm, tl, mr, mm, ml, br, bm, bl'
		puts 'First letter stands for top, middle, bottom. Second letter stands for right, middle, left'
		while win? != true
			puts @player1.name + '(X): Your turn'
			self.display
			update('X')
			if win? == true
				break
			end
			puts @player2.name + '(O): Your turn'
			self.display
			update('O')
			if win? == true
				break
			end
		end
	end

	def win?
		total = @board.top_row + @board.mid_row + @board.bottom_row
		#check if you can win vertically
		if [@board.top_row[0], @board.top_row[1], @board.top_row[2]].all? { |letter| letter == 'X' } or [@board.top_row[0], @board.top_row[1], @board.top_row[2]].all? { |letter| letter == 'O' }
			puts 'You win!'
			self.display
			return true
		elsif [@board.mid_row[0], @board.mid_row[1], @board.mid_row[2]].all? { |letter| letter == 'X' } or [@board.mid_row[0], @board.mid_row[1], @board.mid_row[2]].all? { |letter| letter == 'O'}
			puts 'You win!'
			self.display
			return true
		elsif [@board.bottom_row[0], @board.bottom_row[1], @board.bottom_row[2]].all? { |letter| letter == 'X' } or [@board.bottom_row[0], @board.bottom_row[1], @board.bottom_row[2]].all? { |letter| letter == 'O' }
			puts 'You win!'
			self.display
			return true
		#check if you can win horizontally
		elsif [@board.top_row[0], @board.mid_row[0], @board.bottom_row[0]].all? { |letter| letter == 'X' } or [@board.top_row[0], @board.mid_row[0], @board.bottom_row[0]].all? { |letter| letter == 'O' }
			puts 'You win!'
			self.display
			return true
		elsif [@board.top_row[1], @board.mid_row[1], @board.bottom_row[1]].all? { |letter| letter == 'X' } or [@board.top_row[1], @board.mid_row[1], @board.bottom_row[1]].all? { |letter| letter == 'O' }
			puts 'You win!'
			self.display
			return true
		elsif [@board.top_row[2], @board.mid_row[2], @board.bottom_row[2]].all? { |letter| letter == 'X' } or [@board.top_row[2], @board.mid_row[2], @board.bottom_row[2]].all? { |letter| letter == 'O' }
			puts 'You win!'
			self.display
			return true
		#check if you can win diagonally
		elsif [@board.top_row[0], @board.mid_row[1], @board.bottom_row[2]].all? { |letter| letter == 'X' } or [@board.top_row[0], @board.mid_row[1], @board.bottom_row[2]].all? { |letter| letter == 'O' }
			puts 'You win!'
			self.display
			return true
		elsif [@board.top_row[2], @board.mid_row[1], @board.bottom_row[0]].all? { |letter| letter == 'X' } or [@board.top_row[2], @board.mid_row[1], @board.bottom_row[0]].all? { |letter| letter == 'O' }
			puts 'You win!'
			self.display
			return true
		#checks for cats game
		elsif total.all? {|letter| letter == 'X' or letter == 'O'}
			puts "It's a cats game!"
			self.display
			return true
		end
	end

	class Board
		attr_accessor :top_row, :mid_row, :bottom_row, :in_play
		def initialize
			@top_row = ['-', '-', '-']
			@mid_row = ['-', '-', '-']
			@bottom_row = ['-', '-', '-']
			@in_play = true
		end
	end

	class Player
		attr_accessor :name
		def initialize(name)
			@name = name
		end
	end
end

puts 'Player 1 enter your name'
player1 = gets.chomp
puts 'Player 2 enter your name'
player2 = gets.chomp
a = TicTacToe.new(player1, player2)