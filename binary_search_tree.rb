class Node
	attr_accessor :value, :left, :right, :parent, :visited

	def initialize(value = nil, parent = nil, left = nil, right = nil, visited = false)
		@value = value
		@parent = parent
		@left = left
		@right = right
		@visited = visited
	end

	def insert(value)
		if value < @value
			insert_left(value)
		else
			insert_right(value)
		end
	end

	def insert_left(value)
		if self.left
			left.insert(value)
		else
			self.left = Node.new(value, self)
		end
	end

	def insert_right(value)
		if self.right
			right.insert(value)
		else
			self.right = Node.new(value, self)
		end
	end
end


def build_tree(array)
	tree = Node.new(array.pop)
	array.each do |value|
		tree.insert(value)
	end
	return tree
end

def breadth_first_search(value, node)
	queue = []
	queue << node
	while queue != queue.empty?
		current = queue.shift
		return current if current.value == value
		queue << current.right if !current.right.nil?
		queue << current.left if !current.left.nil?
	end
end

def depth_first_search(value, node)
	stack = []
	stack << node
	while stack != stack.empty?
		current = stack.pop
		return current if current.value == value
		stack << current.right if !current.right.nil?
		stack << current.left if !current.left.nil?
	end
end

def dfs_rec(value, node)
	return nil if node.nil?
	return node if node.value == value
	left = dfs_rec(value, node.left)
	return left if !left.nil?
	right = dfs_rec(value, node.right)
	return right if !right.nil?
end

a = build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
puts breadth_first_search(8, a)
puts depth_first_search(8, a)
puts dfs_rec(8, a)