require 'pry'
def prompt(message)
  puts "--> #{message}"
end

prompt('Welcome to Loan Calculator')

loop do
  amount = ''
  loop do
    prompt('Please enter the loan amount:')
    amount = gets.chomp
    break unless amount.empty? || amount.to_f < 1
    prompt('Only numbers higher than 0 allowed')
  end

  annual_rate = ''
  loop do
    prompt('Please enter the annual interest rate: (in percentage)')
    annual_rate = gets.chomp
    break unless annual_rate.empty? || annual_rate.to_f < 1
    prompt('Only numbers higher than 0 allowed')
  end

  years = ''
  loop do
    prompt('Please enter the loan duration in years')
    years = gets.chomp
    break unless years.empty? || years.to_i < 1
    prompt('Only numbers higher than 0 allowed')
  end

  monthly_rate = (annual_rate.to_f / 100) / 12
  months = years.to_i * 12



  monthly_payment = amount.to_f * 
                    (monthly_rate * (1 + monthly_rate)**months) / 
                    ((1 + monthly_rate)**months - 1)

  prompt("Your monthly payment is: #{format('%02.2f', monthly_payment)}")

  prompt('Would you like another calculation? (Y for yes)')
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt('Thanks for using loan calculator. Good bye!')