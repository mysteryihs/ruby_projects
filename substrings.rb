def substrings(input, array)
	input = input.downcase
	frequencies = Hash.new(0)
	split_words = input.scan(/[\w']+/)
	array.each do |word|
		split_words.each do |each_word|
			each_word.scan(/(#{word})/) { |x| frequencies[x.join] += 1}
		end
	end
	return frequencies
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)