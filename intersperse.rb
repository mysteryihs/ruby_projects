def intersperse(input)
	input = input.split("")
	input = input.flat_map {|x| [x, " "]}[0...-1]
	input.join
end

puts intersperse('humble bundles are for filthy plebians')