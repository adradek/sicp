require_relative 'timed_fermat_prime_test.rb'

reports = []

10.times do |i|
  TimedFermatPrimeTest.search_for_primes(1000 * (10**i), 3, reports)
end

reports.each do |report|
  puts "Elapsed time for #{report[:number]} is #{report[:time].inspect} ms" 
end

base = 1000
prev = nil

reports.map { |r| r[:time] }.each_slice(3) do |arr|
  avg = arr.sum / arr.size
  str = "#{base} => #{avg} ms"
  str << ": #{avg / prev} times slower" if prev 
  puts str
  prev = avg
  base *= 10
end