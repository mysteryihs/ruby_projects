require 'csv'
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_phone(number)
  number.gsub!(/\D/, '')
  if number.length <= 9
    puts "0000000000"
  elsif number.length == 10
    puts number
  elsif number.length == 11 && number[0] == 1
    puts number[1..(number.length + 1)]
  elsif number.length == 11 && number[0] != 1
    puts "0000000000"
  else
    puts "0000000000"
  end
end

def highest_hour(hour_list)
  freq_hours = hour_list.inject(Hash.new(0)) {|h,v| h[v] += 1; h}
  hour_list.max_by { |v| freq_hours[v] }
end

def highest_day(wday_list)
  freq_days = wday_list.inject(Hash.new(0)) {|h,v| h[v] += 1; h}
  wday_list.max_by { |v| freq_days[v] }
end

def prime_hour(date)

end

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager initialized."

contents = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

hours_logged = []
wday_logged = []

contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  phone = row[:homephone]
  clean_phone(phone)
  date = row[:regdate]
  date = DateTime.strptime(date, '%m/%d/%y %k:%M')
  hours_logged << date.hour
  wday_logged << date.wday
  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  save_thank_you_letters(id,form_letter)
end

puts "Hour with highest registration is at: #{highest_hour(hours_logged)}:00"
puts "Day with highest registration is at: #{Date::DAYNAMES[highest_day(wday_logged)]}"