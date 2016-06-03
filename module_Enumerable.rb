module Enumerable
	def my_each
		0.upto(self.size - 1) do |i|
			yield(self[i])
		end
	end

	def my_each_with_index
		0.upto(self.size - 1) do |i|
			yield(i, self[i])
		end
	end

	def my_select
		temp = []
		self.my_each do |i|
			if yield(i)
				temp << i
			end
		end
		temp
	end

	def my_all?
		all = false
		counter = 0
		self.my_each do |i|
			if yield(i)
				counter += 1
			end
		end
		if counter == self.length
			all = true
		end
		all
	end

	def my_any?
		any = false
		self.my_each do |i|
			if yield(i)
				any = true
				break
			end
		end
		any
	end

	def my_none?
		any = true
		self.my_each do |i|
			if yield(i)
				any = false
				break
			end
		end
		any
	end

	def my_count
		counter = 0
		self.my_each do |i|
			if yield(i)
				counter += 1
			end
		end
		counter
	end

	def my_map(proc = nil, &block)
		temp = []
		if proc == nil
			self.my_each do |i|
				temp << yield(i)
			end
		else
			self.my_each do |i|
				temp << proc.call(i)
			end
		end
		temp
	end

	def my_inject(input = nil)
		if input != nil
			total = input
			self.my_each do |i|
				total = yield(total, i)
			end
		else
			total = self[0]
			self[1..-1].my_each do |i|
				total = yield(total, i)
			end
		end
		total
	end
end

def multiply_els(array)
	array.my_inject {|total, n| total * n}
end

my_array = [2,3,4,5,6]
my_proc = Proc.new {|x| x * 4}
puts my_array.my_map {|x| x * 3}

