require_relative 'smallest_divisor.rb'

[199, 1999, 19999, 32, 81, 17, 349, 369, 121, 777, 12321].each do |n|
  puts "The smallest divisor for #{n} is #{SmallestDivisor.calc(n)}"
end