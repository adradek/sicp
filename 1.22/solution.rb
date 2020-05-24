require_relative '../1.21/smallest_divisor.rb'
require 'benchmark'

module TimedPrimeTest
  class << self
    def report(number, reports=nil)
      b_time = Benchmark.measure { prime?(number) } * 1000

      start = Time.now
      prime?(number)
      time = (Time.now - start) * 1000

      if reports
        reports << { number: number, time: time, real_time: b_time.real }
      else
        puts "Elapsed time for #{number} is #{time.inspect}"
      end
    end

    def prime?(number)
      number == SmallestDivisor.calc(number)
    end

    def search_for_primes(number, count, reports=nil)
      if prime?(number)
        report(number, reports)
        search_for_primes(number + 1, count - 1, reports) if count > 1
      else
        search_for_primes(number + 1, count, reports)
      end
    end
  end
end

reports = []

6.times do |i|
  TimedPrimeTest.search_for_primes(1000 * (10**i), 3, reports)
end

reports.each do |report|
  puts "Elapsed time for #{report[:number]} is #{report[:time].inspect} ms || #{report[:real_time]} ms" 
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