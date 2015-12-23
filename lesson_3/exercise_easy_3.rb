# Question 1

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 2

flintstones << "Dino"

# Question 3

flintstones.concat(%w(Dino Hoppy))

# Question 4

advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))
advice.slice(0, advice.index('house')) # returns the same string as String#slice!
# but doesn't mutate the reciver.
# Question 5

statement.scan('t').count

# Question 6

title.center(40)
