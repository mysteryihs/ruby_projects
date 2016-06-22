require 'yaml'

class HangMan
	def initialize
		@secret_word = ""
		@secret_word_hidden = ""
		@guesses = 10
		@guessed_letters = []
		gen_answer
		puts "Would you like to load a game? (Y/N)"
		input = gets.chomp
		if input.downcase == 'y'
			load
		end
		puts @secret_word_hidden
		while @secret_word_hidden.include? "-"
			puts
			puts "Please guess a letter. Or type save to save a game. You have #{@guesses} guesses left."
			correct = false
			input = gets.chomp.downcase
			if input.downcase == 'save'
				saved_game = save(@secret_word, @secret_word_hidden, @guesses)
				File.open("hangman_save.txt", "w"){ |file| file.puts saved_game}
				puts 'Game saved.'
				puts "Please guess a letter."
				input = gets.chomp.downcase
			end
			@guessed_letters << input
			@secret_word.each_with_index do |letter, index|
				if input == letter
					@secret_word_hidden[index] = letter
					correct = true
				end
			end
			if correct == false
				@guesses -= 1
				puts "Incorrect. You have #{@guesses} guesses left."
				puts "You have guessed '#{@guessed_letters.join}'"
			end
			if @guesses == 0
				puts "Sorry, you lose. The answer was #{@secret_word.join}"
				break
			end
			puts @secret_word_hidden
		end
		unless @secret_word_hidden.include? "-"
			puts "You win!"
		end
	end

	def gen_answer
		words = File.open "5desk.txt"
		valid_words = []
		while words.eof? != true
			current_line = words.readline
			if current_line.length > 5 && current_line.length < 12
				valid_words << current_line
			end
		end
		@secret_word = valid_words[rand(valid_words.length + 1)]
		@secret_word = @secret_word.split("")
		@secret_word_hidden = "-" * (@secret_word.length - 1)
	end

	def load
		loaded_file = File.open("hangman_save.txt", "r"){|file| file.read}
		loaded_file = YAML::load(loaded_file)
		@secret_word = loaded_file[0]
		@secret_word_hidden = loaded_file[1]
		@guesses = loaded_file[2]
	end

	def save(secret_word, secret_word_hidden, guesses)
		data_to_save = [secret_word, secret_word_hidden, guesses]
		saved_game = YAML::dump(data_to_save)
	end
end

my_hangman = HangMan.new