require 'socket'               # Get sockets from stdlib
require 'json'

index = File.read("index.html")
thanks = File.read("thanks.html")

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
  client = server.accept       # Wait for a client to connect
  response = client.read_nonblock(256)
  response = response.split(" ")
  if response[0] == 'GET'
  	if response[1] == '/index.html'
  		client.puts "HTTP/1.0 200 OK\r\nContent-Length: #{File.size('index.html')}\r\n\r\n" + index
  	else
  		client.puts "HTTP/1.0 404 Not Found\r\n\r\n"
  	end
  elsif response[0] == 'POST'
  	params = {}; params[:viking] = JSON.parse(response[-1])
  	thanks.gsub!(/<%= yield %>/, "<li>Name: #{params[:viking]["name"]}<li><li>Email: #{params[:viking]["email"]}<li>")
  	client.puts "HTTP/1.0 200 OK\r\nContent-Length: #{File.size('thanks.html')}\r\n\r\n" + thanks
  else
  	client.puts "HTTP/1.0 400 Command Unknown\r\n\r\n"
  end
  client.puts "Closing the connection. Bye!"
  client.close                 # Disconnect from the client
}