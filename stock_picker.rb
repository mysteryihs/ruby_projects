def stock_picker(stock_list)
	list_of_values = []
	max_profit = 0
	buyday = 0
	sellday = 0
	stock_list[0..-2].each_with_index do |value, index|
		stock_list[index + 1..stock_list.length + 1].each do |i|
			list_of_values << i - stock_list[index]
			puts "#{i} - #{stock_list[index]}"
			if i - stock_list[index] > max_profit
				max_profit = i - stock_list[index]
				buyday = index
				sellday = stock_list.index(i)
			end
		end
	end
	puts "#{buyday} and #{sellday}"
end

stock_picker([17,3,6,9,15,8,6,1,10])