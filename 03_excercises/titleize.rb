class String
  def titleize
    words = self.split.map {|word| word.capitalize}
    words.join(" ")
  end
end

puts "The war of the worlds".titleize