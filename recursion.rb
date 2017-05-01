def factorial(n)
	return 1 if n == 1
	n * factorial(n-1)
end

def palindrome?(str)
	return true if str.length <= 1
	if str[0] == str[-1]
		palindrome?(str[1..-2])
	else
		false
	end
end

def beers_on_the_wall(n)
	if n == 0
		puts "No more bottles of beer on the wall"
		return n
	else
		puts "#{n} bottles of beer on the wall."
		beers_on_the_wall(n-1)
	end
end

def fibonacci2(n)
	x = 0
	y = 1
	total = 0
	n.times do 
		total = x + y
		x = y
		y = total
	end
	x
end

def fibonacci(n)
	return n if n == 0
	return n if n == 1
	fibonacci(n-1) + fibonacci(n - 2)
end

def flatten(empty_array, array)
	array.each do |i|
		if i.is_a? Array
			flatten(empty_array, i)
		else
			empty_array << i
		end
	end
	empty_array
end

roman_mapping = {
  1000 => "M",
  900 => "CM",
  500 => "D",
  400 => "CD",
  100 => "C",
  90 => "XC",
  50 => "L",
  40 => "XL",
  10 => "X",
  9 => "IX",
  5 => "V",
  4 => "IV",
  1 => "I"
}

def convert_to_roman(n, roman_mapping, answer = "")
	return n if n == 0
	roman_mapping.each do |key, value|
		if n / key > 0
			answer += value * (n / key)
			n = n % key
			convert_to_roman(n, roman_mapping, answer)
		end
	end
	answer
end

def convert_to_integer(n, roman_mapping, answer = 0)
	return answer if n == ""
	roman_mapping.each do |key, value|
		if n.include?(value)
			answer += key * n.count(value)
			n.gsub!(value, "")
			return convert_to_integer(n, roman_mapping, answer)
		end
	end
end

def merge_sort(array)
	answer = []
	return array if array.length == 1
	if array.length > 1
		b, c = array.each_slice((array.size/2.0).round).to_a
		b = merge_sort(b)
		c = merge_sort(c)
		while b.empty? != true && c.empty? != true
			if b[0] < c[0]
				answer << b.shift
			else
				answer << c.shift
			end
		end
	end
	answer.concat b
	answer.concat c
end

puts merge_sort([8,3,2,9,7,1,5,4,6])