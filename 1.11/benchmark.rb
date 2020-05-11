require 'benchmark/ips'
require_relative './i_solution.rb'
require_relative './r_solution.rb'

# RESULTS

# Calculating -------------------------------------
#            recursive      6.945  (± 0.0%) i/s -     35.000  in   5.040884s
#            iterative    124.754k (± 3.3%) i/s -    633.774k in   5.086229s

# Comparison:
#            iterative:   124753.9 i/s
#            recursive:        6.9 i/s - 17961.87x  (± 0.00) slower

numbers = (15..25)

Benchmark.ips do |test|
  test.config(time: 5, warmup: 5)

  test.report("recursive") do
    numbers.each do |n|
      RSolution.f(n)
    end
  end

  test.report("iterative") do
    numbers.each do |n|
      ISolution.f(n)
    end
  end

  test.compare!
end