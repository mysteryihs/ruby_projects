puts "Input your birth year"
year = gets.chomp
puts "Input your birth month"
month = gets.chomp
puts "Input your birth day"
day = gets.chomp
birthday = Time.mktime(year, month, day)
currentDay = Time.new
spanks = currentDay - birthday
spanks = spanks/60/60/24/365
spanks = spanks.floor
(1..spanks).each do |i|
  puts "Spank!"
end