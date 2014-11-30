require 'date'
time = Time.new
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