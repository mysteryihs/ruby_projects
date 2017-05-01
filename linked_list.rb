class LinkedList
	attr_accessor :head, :node
	def initialize(value)
		@head = Node.new(value)
	end

	def append(value)
		@node = Node.new(value)
		current = @head
		while current.next_node != nil
			current = current.next_node
		end
		current.next_node = @node
	end

	def prepend(value)
		@head = Node.new(value, @head)
	end

	def size
		current = @head
		return 1 if current.next_node == nil
		count = 1
		while current.next_node != nil
			count += 1
			current = current.next_node
		end
		count
	end

	def head
		@head
	end

	def tail
		current = @head
		while current.next_node != nil
			current = current.next_node
		end
		return current
	end

	def at(index)
		return @head if index == 0
		current = @head
		count = 0
		while current.next_node != nil
			current = current.next_node
			count += 1
			if count == index
				return current
			end
		end
	end

	def pop
		return puts "Cannot pop single item in list" if self.size == 1
		current = @head
		previous = nil
		while current.next_node != nil
			previous = current
			current = current.next_node
		end
		previous.next_node = nil
		return current
	end

	def contains?(input)
		switch = false
		current = @head
		if current.value == input
			return true
		end
		while current != nil
			if current.value == input
				switch = true
			end
			current = current.next_node
		end
		switch
	end

	def find(data)
		current = @head
		return 0 if current.value == data
		count = 0
		while current.next_node != nil
			current = current.next_node
			count += 1
			if current.value == data
				return count
			end
		end
		return "Not found."
	end

	def to_s
		response = ""
		current = @head
		response += "( #{current.value} ) -> "
		while current.next_node != nil
			current = current.next_node
			response += "( #{current.value} ) -> "
		end
		response += "nil"
	end

	def insert_at(value, index)
		current = @head
		previous = nil
		return prepend(value) if index == 0
		count = 0
		while current.next_node != nil
			previous = current
			current = current.next_node
			count += 1
			if count == index
				previous.next_node = Node.new(value, current)
			end
		end
	end

	def remove_at(index)
		return @head = head.next_node if index == 0
		current = @head
		previous = nil
		count = 0
		while current.next_node != nil
			previous = current
			current = current.next_node
			count += 1
			if count == index
				previous.next_node = current.next_node
			end
		end
	end

	def self.remove_dup(list)
		answer = LinkedList.new(list.head.value)
		current = list.head.next_node
		while current.next_node != nil
			if !answer.contains?(current.value)
				answer.append(current.value)
			end
			current = current.next_node
		end
		return answer
	end

	def nth_from_last_node(list, index)
		current = list.head
		p = 1
		while current.next_node != nil
			p += 1
			current = current.next_node
		end
		p -= index
		current = list.head
		p.times do
			current = current.next_node
		end
		while current.next_node != nil
			puts current.value
			current = current.next_node
		end
	end

	def list_sum(list1, list2)
		number1 = ""
		number2 = ""
		current = list1.head
		while current != nil
			number1.prepend(current.value.to_s)
			current = current.next_node
		end
		current = list2.head
		while current != nil
			number2.prepend(current.value.to_s)
			current = current.next_node
		end
		answer = (number1.to_i + number2.to_i).to_s.split("")
		list = LinkedList.new(answer.shift)
		answer.each do |number|
			list.append(number)
		end
		puts number1
		puts number2
		return list
	end

	def find_corrupted(list)
		unique_nodes = []
		current = list.head
		while current.next_node != nil
			if !unique_nodes.include?(current)
				unique_nodes << current
			else
				return current
			end
			current = current.next_node
		end
	end

	def corrupt_list(list)
		current = list.head
		while current.next_node != nil
			current = current.next_node
		end
		current.next_node = list.head
	end

	class Node
		attr_accessor :value, :next_node
		def initialize(value = nil, next_node = nil)
			@value = value
			@next_node = next_node
		end
	end
end
# a = LinkedList.new(10)
# a.append(2)
# a.append(5)
# a.prepend(1)
# puts a.to_s
# a.insert_at(15, 0)
# puts a.to_s
# a.remove_at(2)
# puts a.to_s
# a.remove_at(1)
# puts a.to_s
# puts a.size
# puts a.find(5)
# puts a.contains?(15)
# a.pop
# puts a.to_s
# puts a.tail.value

a = LinkedList.new(3)
a.append(6)
a.append(9)
b = LinkedList.new(1)
b.append(2)
b.append(5)

a.corrupt_list(a)
puts a.find_corrupted(a).value
puts b