def average(*numbers)
	hold = 0.0
  numbers.inject(0) do |sum, number|
    sum += number
    hold = sum
  end
  hold = hold / numbers.length
end

puts average(83.0, 83, 115, 100, 100, 70, 100, 120, 92, 50, 92, 92, 93) #SpellingTST 5/09
puts average(90.0, 90, 80, 90, 95, 100, 100, 90, 70, 90, 90, 90, 90, 90, 100) #HW 4/22
puts average(100.0, 93, 83, 89, 83, 0, 72, 100, 86, 90, 86, 83, 80, 92, 70, 70, 90, 100) #QZ 4/22
puts average(80.0, 92, 69, 71, 96, 95, 84, 93, 87, 92, 93, 93, 95, 100, 94, 94, 
80, 82, 90, 90, 88, 91, 92, 87, 100, 100) #TST 4/22 ONE TEST MISSING