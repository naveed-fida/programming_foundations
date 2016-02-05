def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  return true if number == '0'
  number.to_i != 0
end

prompt("Welcome to the calculator! What's your name?")

name = ''
loop do
  name = gets.chomp
  break unless name.empty?
  prompt("Make sure to use a valid name.")
end

prompt("Hello #{name}")

loop do
  number1 = ''
  loop do
    prompt("What's the first number")
    number1 = gets.chomp

    break if valid_number?(number1)
    prompt("Hmmm... that doesn't look like a valid number")
  end

  number2 = ''
  loop do
    prompt("What's the second number")
    number2 = gets.chomp

    break if valid_number?(number2)
    prompt("Hmmm... that doesn't look like a valid number")
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2)subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp
    break if %w(1, 2, 3, 4).include?(operator)
    prompt("Must use 1, 2, 3 or 4")
  end

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end

  puts result

  prompt('Do you want to perform another calculation? (Y for yes)')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for using the calculator. Good bye')
