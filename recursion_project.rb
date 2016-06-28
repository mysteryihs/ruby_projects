def fibs(n)
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

def fibs_rec(n)
	return n if n == 0
	return n if n == 1
	fibonacci(n-1) + fibonacci(n - 2)
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