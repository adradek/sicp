require_relative '../1.21/smallest_divisor.rb'

module PrimeTestShared
  def report(number, reports=nil)
    start = Time.now
    prime?(number)
    time = (Time.now - start) * 1000

    if reports
      reports << { number: number, time: time }
    else
      puts "#{self} for #{number} is #{time.inspect}"
    end
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

module TimedPrimeTest
  class << self
    include PrimeTestShared

    def prime?(number)
      number == SmallestDivisor.calc(number)
    end
  end
end