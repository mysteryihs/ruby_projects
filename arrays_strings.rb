def unique?(input)
	input = input.split("")
	count = Hash.new
	input.each do |letter|
		if count[letter].nil?
			count[letter] = 1
		else
			count[letter] += 1
		end
	end
	count.each do |key, value|
		if value != 1
			return false
		end
	end
	return true
end

def remove_duplicates(input)
	input = input.split("")
	answer = []
	input.each do |letter|
		if !answer.include?(letter)
			answer << letter
		end
	end
	return answer
end

def anagrams?(string1, string2)
	string1 = string1.delete(' ').downcase.split("")
	string2 = string2.delete(' ').downcase.split("")
	string1_count = Hash.new
	string2_count = Hash.new
	string1.each do |letter|
		if string1_count[letter].nil?
			string1_count[letter] = 1
		else
			string1_count[letter] += 1
		end
	end
	string2.each do |letter|
		if string2_count[letter].nil?
			string2_count[letter] = 1
		else
			string2_count[letter] += 1
		end
	end
	return true if string1_count == string2_count
	return false
end

puts anagrams?('William Shakespeare','I am a weakish speller')