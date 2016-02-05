puts 'Welcome to Calculator!'

puts "What's the first number?"
number1 = gets.chomp.to_i

puts "What's the second number?"
number2 = gets.chomp.to_i

puts 'What operation would you like to perform? 1) add, 2)subtract, 3) multiply, 4) divide'
operation = gets.chomp

case operation
when '1'
  result = number1 + number2
when '2'
  result = number1 - number2
when '3'
  result = number1 * number2
when '4'
  result = number1.to_f / number2
end

puts result