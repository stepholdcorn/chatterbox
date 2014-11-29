time = Time.new

def get_response(input)

	if input == "quit"
	exit(0)
	
	else

  	key = RESPONSES.keys.select {|k| /#{k}/ =~ input }.sample
  	/#{key}/ =~ input
  	response = RESPONSES[key]
	response.nil? ? 'sorry?' : response % { c1: $1, c2: $2}
	end
	
end

RESPONSES = { 'goodbye' => 'bye', 
              'sayonara' => 'sayonara', 
              'how are you?' => 'I\'m ok thanks, are you ok?',
              'what day is it?' => 'today is ' + (time.strftime '%A'),
              'what date is it?' => 'today is ' + (time.strftime '%x'),
              'yes' => 'good',
              'no' => 'oh dear',
              'My favourite food is (.*)' => 'eww, I don\'t like %{c1}',
              'the weather is (.*)' => 'I hate it when it\'s %{c1}', 
              'I live in (.*)' => 'I\'ve never been to %{c1}, is it nice there?',
              'I love (.*)' => 'I love %{c1} too', 
              'I groove to (.*) and (.*)' => 'I love %{c1} but I hate %{c2}'}

puts "Hello, what's your name?"
name = gets.chomp
puts "Hello #{name}"

while(input = gets.chomp) do
  puts get_response(input)
end