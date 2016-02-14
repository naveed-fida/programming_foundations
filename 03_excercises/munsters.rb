munsters = {
  'Herman' => { 'age' => 32, 'gender' => 'male' },
  'Lily' => { 'age' => 30, 'gender' => 'female' },
  'Grandpa' => { 'age' => 402, 'gender' => 'male' },
  'Eddie' => { 'age' => 10, 'gender' => 'male' },
  'Marilyn' => { 'age' => 23, 'gender' => 'female'}
}

munsters.each do |member|
  case member[1]['age']
  when 0..18
    member[1]['age_group'] = 'kid'
  when 18..65
    member[1]['age_group'] = 'adult'
  else
    member[1]['age_group'] = 'senior'
  end
end

puts munsters