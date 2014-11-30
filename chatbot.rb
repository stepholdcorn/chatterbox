require 'colorize'
require './responses.rb'



def user_prompt
	print ">>  ".light_yellow
end

def bot_prompt
	print "**  ".red
end

def get_response(input)

	if input == "quit"
	exit(0)
	
	else

  	key = RESPONSES.keys.select {|k| /#{k}/ =~ input.downcase }.sample
  	/#{key}/ =~ input
  	bot_prompt
  	response = RESPONSES[key]
	response.nil? ? 'sorry? I don\'t know much about that, can we talk about something else?' : response % { c1: $1, c2: $2, c3: $3}
	end
	
end

bot_prompt
puts "Hello, what's your name?".light_red
user_prompt
name = gets.chomp
bot_prompt
puts "Hello #{name}, what can I help you with?".light_red
user_prompt

while(input = gets.chomp) do
  puts get_response(input).light_red
  user_prompt
end