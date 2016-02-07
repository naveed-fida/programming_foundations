#require 'pry'
require 'yaml'

MESSAGES = YAML.load_file('calculator_messages.yml')
LANGUAGE = 'es'

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def valid_number?(number)
  return true if number == '0'
  number.to_i != 0
end


prompt('welcome')

name = ''
loop do
  name = gets.chomp
  break unless name.empty?
  prompt('valid_name')
end

prompt("Hello #{name}")

loop do
  number1 = ''
  loop do
    prompt('first_number')
    number1 = gets.chomp

    break if valid_number?(number1)
    prompt('not_valid_num')
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = gets.chomp

    break if valid_number?(number2)
    prompt('not_valid_num')
  end

  prompt('operator')

  operator = ''
  loop do
    operator = gets.chomp
    break if %w(1 2 3 4).include?(operator)
    prompt('four_options')
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

  prompt('another_calculation')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('thanks')
