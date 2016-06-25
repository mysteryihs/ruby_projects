require "jumpstart_auth"
require 'bitly'

class MicroBlogger
	attr_reader :client

	def initialize
		puts "Initializing MicroBlogger"
		@client = JumpstartAuth.twitter
	end

	def tweet(message)
		if message.length <= 140
			@client.update(message)
		else
			puts "Tweet too long. Did not update."
		end
	end

	def dm(target, message)
		screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
		puts "Trying to send #{target} this direct message"
		puts message
		if screen_names.include? target
			message = "d @#{target} #{message}"
			tweet(message)
		else
			puts "User not found within your following list."
		end

	end

	def followers_list
		screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
	end

	def spam_my_followers(message)
		puts "Spamming all your followers..."
		all_followers = followers_list
		all_followers.each do |follower|
			dm(follower, message)
		end
	end

	def everyones_last_tweet
		friends = @client.friends.collect { |friend| @client.user(friend)}
		friends = friends.sort_by {|friend| friend.screen_name.downcase}
		friends.each do |friend|
			timestamp = friend.status.created_at
			puts friend.screen_name + " at " + timestamp.strftime("%A, %b %d")
			puts friend.status.text
			puts ""
		end
	end

	def shorten(original_url)
		puts "Shortening this URL: #{original_url}"
		Bitly.use_api_version_3
		bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
		return bitly.shorten(original_url).short_url.to_s
	end

	def run
		puts "Welcome to the JSL Twitter Client!"
		command = ""
		while command != "q"
			printf "enter command: "
			input = gets.chomp
			parts = input.split(" ")
			command = parts[0]
			case command
    			when 'q' then puts "Goodbye!"
    			when 't' then tweet(parts[1..-1].join(" "))
    			when 'dm' then dm(parts[1], parts[2..-1].join(" "))
    			when 'spam' then spam_my_followers(parts[1..-1].join(" "))
    			when 'elt' then everyones_last_tweet
    			when 's' then shorten(parts[1..-1].join)
    			when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
    			else
      			puts "Sorry, I don't know how to #{command}"
  			end
		end
	end
end

blogger = MicroBlogger.new
blogger.run