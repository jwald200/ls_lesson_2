# Question 1

# nil. since ruby can't face an undefined variable it assigns nil to it

# Question 2
"hi there"

# Question 3

# "one is: two"
# "two is: three"
# "three is: one"

# Question 4

def generate_UUID
  characters = [*0..9].join.split(//) + [*'a'..'z']

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless sections[index] == sections.last
  end

  uuid
end

# Question 5

ef dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
  end

  true
end
