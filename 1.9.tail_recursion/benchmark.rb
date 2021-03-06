require 'benchmark/ips'
require_relative './recursive_process.rb'
require_relative './tail_recursion_iterative_process.rb'

FIBO_WANTED_NUMBERS = [12, 53, 41, 39, 18, 29, 70, 62, 90, 82]

Benchmark.ips do |test|
  test.config(time: 5, warmup: 5)

  test.report("recursive") do
    FIBO_WANTED_NUMBERS.each do |n|
      RecursiveProcess.factorial(n)
    end
  end

  test.report("tail recursion") do
    FIBO_WANTED_NUMBERS.each do |n|
      IterativeProcess.factorial(n)
    end
  end

  test.compare!
end