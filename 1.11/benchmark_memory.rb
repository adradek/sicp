require 'benchmark/memory'
require_relative './i_solution.rb'
require_relative './r_solution.rb'

numbers = (15..25)

Benchmark.memory do |test|
  test.report("recursive") do
    numbers.each do |n|
      x = "Hello world"
      RSolution.f(n)
    end
  end

  test.report("iterative") do
    numbers.each do |n|
      x = "Hello world"
      ISolution.f(n)
    end
  end

  test.compare!
end