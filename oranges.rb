class OrangeTree
	def initialize
		@treeHeight = 1
		@oranges = 0
	end
	def height
		puts "Your tree is " + @treeHeight.to_s + " meter(s) high."
	end
	def oneYearPasses
		@treeHeight += 1
		if @treeHeight >= 8
			puts "Your tree withered and died."
			@treeHeight = 0
			@oranges = 0
		else
			if @treeHeight >= 2
			@oranges += 1
			end
			if @treeHeight >= 3
			@oranges += 1
			end
			if @treeHeight >= 5
			@oranges += 1
			end
		end	
	end
	def pickAnOrange
		if @oranges >= 1
			puts "An orange was picked. It was delicious."
			@oranges -= 1
		else
			puts "You have no oranges on your tree."
		end
	end
	def countOranges
		puts "You have " + @oranges.to_s + " oranges on your tree."
	end
	end

myTree = OrangeTree.new
myTree.height
myTree.oneYearPasses
myTree.height
myTree.oneYearPasses
myTree.height
myTree.oneYearPasses
myTree.height
myTree.countOranges
myTree.pickAnOrange
myTree.countOranges
myTree.oneYearPasses
myTree.height
myTree.oneYearPasses
myTree.height
myTree.oneYearPasses
myTree.height
myTree.countOranges
myTree.height
myTree.oneYearPasses
myTree.countOranges