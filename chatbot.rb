require 'colorize'
require 'date'

time = Time.new

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

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'how are you?' => 'I\'m ok thanks, are you ok?',
              'what is your name?' => 'My name is Percy, pleased to meet you',
              'where do you live?' => 'I live here silly! Where do you live?',
              'what is your favourite food?' => 'I like chips, you?',
              'until christmas?' => 'there are ' + ((Date.new(2014, 12, 25)-(Date.today)).to_i.to_s) + ' days until Christmas, yay!',
              'help' => 'I\'m good at telling the time and date, or we can talk about something else?',
              'what day is it?' => 'today is ' + (time.strftime '%A'),
              'date' => 'today is ' + (time.strftime '%x'),
              'time' => 'it is ' + (time.strftime '%r'),
              'thanks' => 'you\'re very welcome',
              'yes' => 'good',
              'no' => 'oh dear',
              'ok' => 'great, can I help you with anything else?',
              'something else' => 'You could ask me how long it is until Christmas?',
              'my favourite food is (.*)' => 'eww, I don\'t like %{c1}',
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'i live in (.*)' => 'I\'ve never been to %{c1}, is it nice there?',
              'i love (.*)' => 'I love %{c1} too', 
              'i groove to (.*), (.*) and (.*)' => 'I love %{c1} and %{c3}, but I hate %{c2}'}

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