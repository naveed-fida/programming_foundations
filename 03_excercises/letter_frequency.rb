statement = 'The Flintstones Rock'

letters = ('A'..'Z').to_a + ('a'..'z').to_a

result = {}

letters.each do |letter|
  frequency = statement.scan(letter).length
  result[letter] = frequency if frequency > 0
end

puts result