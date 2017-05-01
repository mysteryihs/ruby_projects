def printMove(src, dest)
	puts 'Move from ' + src.to_s + ' to ' + dest.to_s
end

def Towers(n, src, dest, aux)
	if n == 1
		printMove(src, dest)
	else
		Towers(n-1, src, aux, dest)
		Towers(1, src, dest, aux)
		Towers(n-1, aux, dest, src)
	end
end

#Towers(3, 'src', 'dest', 'aux')

class TowersOfHanoi
	attr_accessor :src, :aux, :dest
	def initialize(n)
		@src = []
		@aux = []
		@dest = []
		n.downto(1) {|i| @src << i}
		Towers(n, @src, @dest, @aux)
		print @dest
	end

	def makeMove(src, dest)
		puts 'Move from ' + src.to_s + ' to ' + dest.to_s
		dest << src.pop
	end

	def Towers(n, src, dest, aux)
		if n == 1
			makeMove(src, dest)
		else
			Towers(n-1, src, aux, dest)
			Towers(1, src, dest, aux)
			Towers(n-1, aux, dest, src)
		end
	end
end

#mytower = TowersOfHanoi.new(3)

class MyQueue
	attr_accessor :input, :output
	def initialize
		@input = []
		@output = []
	end

	def enqueue(element)
		@input << element
	end

	def dequeue
		if @output.empty?
			while !@input.empty?
				@output << @input.pop
			end
		end
		@output.pop
	end
end

def stackSort(stack)
	in_stack = stack
	temp_stack = []
	while !in_stack.empty?
		begin
		temp_stack << in_stack.pop
			if temp_stack[-1] > in_stack[-1]
				temp_stack[-1], in_stack[-1] = in_stack[-1], temp_stack[-1]
				while !temp_stack.empty?
					in_stack << temp_stack.pop
				end
			end
		rescue
			return temp_stack
		end
	end
	temp_stack
end

print stackSort([30, -5, 18, 14, -3])