require_relative '../1.21/smallest_divisor.rb'
require_relative 'prime_test_shared.rb'

module TimedPrimeTest
  class << self
    include PrimeTestShared

    def prime?(number)
      number == SmallestDivisor.calc(number)
    end
  end
end