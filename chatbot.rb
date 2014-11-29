time = Time.new

def user_prompt
	print ">>  "
end

def bot_prompt
	print "**  "
end

def get_response(input)

	if input == "quit"
	exit(0)
	
	else

  	key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  	/#{key}/ =~ input
  	bot_prompt
  	response = RESPONSES[key]
	response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
	end
	
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'how are you?' => 'I\'m ok thanks, are you ok?',
              'what day is it?' => 'today is ' + (time.strftime '%A'),
              'what date is it?' => 'today is ' + (time.strftime '%x'),
              'thanks' => 'you\'re very welcome',
              'yes' => 'good',
              'no' => 'oh dear',
              'My favourite food is (.*)' => 'eww, I don\'t like %{c1}',
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I live in (.*)' => 'I\'ve never been to %{c1}, is it nice there?',
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'}

bot_prompt
puts "Hello, what's your name?"
user_prompt
name = gets.chomp
bot_prompt
puts "Hello #{name}"
user_prompt

while(input = gets.chomp) do
  puts get_response(input)
  user_prompt
end