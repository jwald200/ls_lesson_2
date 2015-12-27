# Question 1

#10.times { |i| puts "#{' ' * i}The Flintstones Rock!"}

# Question 2

statement = "The Flintstones Rock"

letter_frequency = Hash.new(0)
statement.each_char do |char|
  next if char == ' '
  letter_frequency[char] += 1
end

p letter_frequency

# Question 3

(40+2).to_s
puts "the value of 40 + 2 is #{40 + 2}" # string interpolation handles conversion for free

# Question 4

# 1, 3
# 1, 2

# Question 5
  # will come back bs"d

# Question 6

# rolling_buffer1 mutates the buffer array
# rolling_buffer2 works on a copy of the input array

# Question 7

limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Question 8

def titleize(str)
  str.split.map { |word| word.downcase.capitalize }.join(' ')
end

# Question 9

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, details|
  case details['age']
  when 0..17
    details['group_age'] = 'kid'
  when 18..64
    details["group_age"] = 'adult'
  else
    details["group_age"] = 'senior'
  end
end

p munsters
