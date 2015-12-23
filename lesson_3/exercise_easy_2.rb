# Question 1

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.key?('Spot')
ages.include?('Spot')
ages.member?('spot')
ages.has_key?('spot')

# Question 2

ages.values.inject(:+)
ages.values.reduce(:+)

# Question 3

ages.keep_if { |name, age| age < 100 }
ages.select! { |name, age| age < 100 }

# Question 4

munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!

# Question 5

ages.merge!(additional_ages)

# Question 6

ages.values.min

# Question 7

advice.include?("Dino")
advice.match("Dino")

# Question 8

flintstones.index { |name| name[0, 2] == "Be" }
flintstones.index { |name| name.start_with?("Be") }

# Question 9, 10

flintstones.map! { |name| name[0,3] }
