# Question 1

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

munsters.values.reduce(0) do |sum, details|
  if details['gender'] == 'male'
    sum + details['age']
    else
      sum
    end
end

# Question 2

munsters.each do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end

# Question 3

def not_so_tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param += ["rutabaga"]

  return a_string_param, an_array_param
end

my_string = "pumpkins"
my_array = ["pumpkins"]
my_string, my_array = not_so_tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 4

sentence = "Humpty Dumpty sat on a wall."

words = sentence.split(/\W/)
words.reverse!
backwards_sentence = words.join(' ') + '.'

# Question 5

34

# Question 6

# the original hash was modified since Hash#[]=

# Question 7

# paper

# Question 8

# no
