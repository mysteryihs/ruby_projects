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