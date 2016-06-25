require 'socket'
require 'json'
 
puts "Do you want to GET or POST?"
input = gets.chomp
if input.downcase == 'get'
	host = 'localhost'     # The web server
	port = 2000                           # Default HTTP port
	path = "/index.html"                 # The file we want 
	# This is the HTTP request we send to fetch a file
	request = "GET #{path} HTTP/1.0\r\n\r\n"
	socket = TCPSocket.open(host,port)  # Connect to server
	socket.print(request)               # Send request
	response = socket.read              # Read complete response
	# Split response at first blank line into headers and body
	headers,body = response.split("\r\n\r\n", 2) 
	puts headers
	puts body                          # And display it
elsif input.downcase == 'post'
	puts "Enter a name."
	name = gets.chomp
	puts "Enter an email"
	email = gets.chomp
	viking = {:name => name, :email => email}

	host = 'localhost'
	port = 2000
	path = "/server.rb"
	request = "POST #{path} HTTP/1.0\r\nContent-Length:#{viking.to_json.size}\r\n\r\n" + viking.to_json
	socket = TCPSocket.open(host, port)
	socket.print(request)
	response = socket.read
	headers,body = response.split("\r\n\r\n", 2) 
	puts headers
	puts body   
else
	puts "Error! Incorrect command."
end