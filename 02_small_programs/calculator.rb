#srequire 'pry'
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(number)
  return true if number == '0'
  number.to_i != 0
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp
  break unless name.empty?
  prompt(MESSAGES['valid_name'])
end

prompt("Hello #{name}")

loop do
  number1 = ''
  loop do
    prompt(MESSAGES['first_number'])
    number1 = gets.chomp

    break if valid_number?(number1)
    prompt(MESSAGES['not_valid_num'])
  end

  number2 = ''
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets.chomp

    break if valid_number?(number2)
    prompt(MESSAGES['not_valid_num'])
  end

  prompt(MESSAGES['operator'])

  operator = ''
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt(MESSAGES['four_options'])
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

  prompt(MESSAGES['another_calculation'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['thanks'])
