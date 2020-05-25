require_relative '../1.22/timed_prime_test.rb'
require_relative 'odd_divisors_searcher.rb'

module BetterPrimeTest
  class << self
    include PrimeTestShared

    def prime?(number)
      number == OddDivisorsSearcher.calc(number)
    end
  end
end

reports = []

6.times do |i|
  TimedPrimeTest.search_for_primes(1000 * (10**i), 3, reports)
  BetterPrimeTest.search_for_primes(1000 * (10**i), 3, reports)
end

base = 1000

reports.map { |r| r[:time] }.each_slice(6) do |arr|
  puts "base: #{base}, #{arr[0..2].sum / arr[3..5].sum}"
  base *= 10
end