require_relative '../../1.22/prime_test_shared.rb'

module TimedFermatPrimeTest
  class << self
    include PrimeTestShared

    def prime?(number)
      fast_prime?(number, 1)
    end

    def fast_prime?(number, attempts)
      return true if attempts == 0
      return fast_prime?(number, attempts - 1) if fermat_test(number)
      false
    end

    def fermat_test(number)
      random_base = rand(number - 1) + 1
      random_base == expmod(random_base, number, number)
    end

    def expmod(base, exp, mod)
      return 1 if exp == 0
      return (expmod(base, exp / 2, mod) ** 2) % mod if exp.even?
      (base * expmod(base, exp - 1, mod)) % mod
    end
  end
end