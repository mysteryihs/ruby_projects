class MasterMind
	def initialize
		puts 'Do you want to guess the code? (Y/N)'
		response = gets.chomp
		if response.downcase == 'y'
			initialize_player
		elsif response.downcase == 'n'
			initialize_computer
		else
			puts "I don't understand."
		end
	end

	def initialize_computer
		@list_of_colors = ['red', 'green', 'blue', 'yellow', 'white', 'black']
		puts 'Choose 4 of the 6 colors: Red, Green, Blue, Yellow, White and Black.'
		input = gets.chomp
		attempt = input.downcase.split
		attempt = guess_checker(attempt)
		player_secret_key = attempt
		puts 'Computer will now attempt to guess your code.'
		guess_computer(player_secret_key)
	end

	def initialize_player
		puts 'Choose 4 of the 6 colors: Red, Green, Blue, Yellow, White and Black.'
		@list_of_colors = ['red', 'green', 'blue', 'yellow', 'white', 'black']
		@in_play = true
		@secret_key = []
		@guesses_left = 12
		gen_code
		while @guesses_left > 0
			if guess
				return true
			end
			@guesses_left -= 1
			puts "You have #{@guesses_left} guesses left."
			puts 
		end
		puts "You lose. The answer was #{@secret_key}"
	end

	def guess_checker(attempt)
		valid_answer = false
		until valid_answer == true && attempt.length == 4
			if (attempt.all? {|x| @list_of_colors.include?(x)}) && (attempt.length == 4)
				valid_answer = true
			else
				valid_answer = false
				puts 'Please choose EXACTLY 4 of the 6 colors: Red, Green, Blue, Yellow, White and Black'
				input = gets.chomp
				attempt = input.downcase.split
			end
		end
		return attempt
	end

	def gen_guess
		computer_guess = []
		4.times do
			computer_guess << @list_of_colors[rand(@list_of_colors.length)]
		end
		computer_guess
	end

	def guess_computer(player_secret_key)
		secret_key_clone = player_secret_key.dup
		right = 0
		sorta_right = 0
		computer_guess = gen_guess
		#checks for right colors in the right spot
		computer_guess.each_with_index do |value1, index1|
			secret_key_clone.each_with_index do |value2, index2|
				if value1 == value2 && index1 == index2
					computer_guess[index1] = nil
					secret_key_clone[index2] = nil
					right += 1
				end
			end
		end
		#checks for right colors in the wrong spot
		computer_guess.each_with_index do |value, index|
			if secret_key_clone.include?(value) && value != nil
				computer_guess[index] = nil
				secret_key_clone.delete_at(secret_key_clone.find_index(value))
				sorta_right += 1
			end
		end
		if right == 4
			puts 'Computer wins!'
			return true
		end
		puts "Computer guessed #{right.to_s} correct colors in the right spot and #{sorta_right.to_s} correct colors in the wrong spot."
		return right
	end

	def guess
		input = gets.chomp
		attempt = input.downcase.split
		attempt = guess_checker(attempt)
		secret_key_clone = @secret_key.dup
		right = 0
		sorta_right = 0
		#checks for right colors in the right spot
		attempt.each_with_index do |value1, index1|
			secret_key_clone.each_with_index do |value2, index2|
				if value1 == value2 && index1 == index2
					attempt[index1] = nil
					secret_key_clone[index2] = nil
					right += 1
				end
			end
		end
		#checks for right colors in the wrong spot
		attempt.each_with_index do |value, index|
			if secret_key_clone.include?(value) && value != nil
				attempt[index] = nil
				secret_key_clone.delete_at(secret_key_clone.find_index(value))
				sorta_right += 1
			end
		end
		if right == 4
			puts 'You win!'
			return true
		end
		puts "You have #{right.to_s} correct colors in the right spot and #{sorta_right.to_s} correct colors in the wrong spot."
		return false
	end

	private


	def gen_code
		4.times do 
			@secret_key << @list_of_colors[rand(@list_of_colors.length)]
		end
	end

end

a = MasterMind.new