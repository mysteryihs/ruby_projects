def bubble_sort(array)
	counter = array.length
	while counter > 0
		array.each_with_index do |value, index|
			if array[index + 1] == nil
			elsif array[index] > array[index + 1]
				array[index], array[index + 1] = array[index + 1], array[index]
			end
		end
		counter -= 1
	end
	array
end

puts bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(array)
	counter = array.length
	while counter > 0
		array.each_with_index do |value, index|
			if array[index + 1] == nil
			elsif yield(array[index], array[index + 1]) > 0
					array[index], array[index + 1] = array[index + 1], array[index]
			end
		end
		counter -= 1
	end
	puts array
end

bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length-right.length
end