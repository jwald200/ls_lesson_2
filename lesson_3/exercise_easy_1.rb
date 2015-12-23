# Question 1

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers # 1 2 2 3

# Question 2

# != means not equals
# ? : is the ternary operator
# !!<some object> turns any object to its boolean equivalent
# !<some object> turns an object to the opposite of thier boolean equivalent

# Question 3

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')

# Question 4

numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1) # returns 2. numbers is now [1, 3, 4, 5]
numbers.delete(1) # returns 1. numbers is now [2, 3, 4, 5]

# Question 5

(10..100).include?(42)
# or
(10..100)cover?(42)

# Question 6

famous_words = "seven years ago..."

famous_words = "Four score and " + famous_words
famous_words.prepend("Four score and ")
famous_words = "Four score and " << famous_words

# Question 7

eval(how_deep) # 42

# Question 8

flintstones.flatten!

# Question 9

flintstones.select { |k, _| k == 'Barney'}.to_a
flintstones.assoc('Barney')

# Question 10

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end
