VALID_CHOICES = %w(rock paper scissors).freeze

def prompt(message)
  puts "=> #{message}"
end

def display_result(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')

    prompt('You won!')
  elsif (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors') ||
        (player == 'scissors' && computer == 'rock')

    prompt('You lose!')
  else
    prompt("It's a tie")
  end
end

choice = ''
loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    break if VALID_CHOICES.include?(choice)
    prompt('That is not a valid choice')
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You chose: #{choice}; compter chose: #{computer_choice}")

  display_result(choice, computer_choice)

  prompt('Do you wanna play again?')
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Goodbye')