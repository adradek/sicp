require_relative "../1.24/ruby/timed_fermat_prime_test.rb"

module CheckFermatCompletely
  def self.passes?(number)
    passes_iter?(number, 1)
  end

  def self.passes_iter?(number, base)
    return true if number == base
    return false if TimedFermatPrimeTest.expmod(base, number, number) != base
    passes_iter?(number, base + 1)
  end
end

[ 561, 1105, 1729, 2465, 2821, 6601 ].each do |cn|
  puts "Number #{cn} passes the test: #{CheckFermatCompletely.passes?(cn)}"
end