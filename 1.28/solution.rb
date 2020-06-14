module MillerRabin
  class << self
    def prime?(n, times, base=nil)
      return true if times == 0
      miller_rabin_test(n, base) && prime?(n, times - 1, base)
    end

    def miller_rabin_test(n, base=nil)
      base ||= rand(n - 2) + 2   # (2 .. n-2)
      expmod_plus(base, n - 1, n) == 1
    end

    def expmod_plus(a, exp, n)
      return 1 if exp == 0
      if exp.even?
        zero_or_expmod(a, exp, n)
      else
        (a * expmod_plus(a, exp - 1, n)) % n
      end
    end

    def zero_or_expmod(a, exp, n)
      halved = expmod_plus(a, exp / 2, n)
      res = halved ** 2 % n
      res == 1 && halved != 1 && halved != (n - 1) ? 0 : res
    end
  end
end

# [37, 63, 19, 117, 109, 43, 2465, 2821, 6601].each do |num|
#   puts "Num: #{num} is prime: #{MillerRabin.prime?(num, 4)}"
# end

# primes = [11, 13, 19, 17, 37, 43, 109]

# primes.concat([
#   1009, 1013, 1019,
#   10_007, 10_009, 10_037,
#   100_003, 100_019, 100_043,
#   1_000_003, 1_000_033, 1_000_037
# ])

carmichaels = [561, 2465, 2821, 6601]

carmichaels.each do |prime|
  result = { right: 0, wrong: 0, exceptions: [] }
  (2 .. prime-2).each do |base|
    if !MillerRabin.prime?(prime, 1, base)
      result[:right] += 1
    else
      result[:wrong] += 1
      result[:exceptions] << base
    end
  end

  puts "#{prime}: #{result[:right]} / #{result[:wrong]} - #{result[:exceptions].inspect}\n\n\n\n"
end