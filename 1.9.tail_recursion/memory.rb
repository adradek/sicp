require_relative './recursive_process.rb'
# require_relative './tail_recursion_iterative_process.rb'

require 'memory_profiler'

FIBO_WANTED_NUMBERS = [12, 53, 41, 39, 18, 29, 70, 62, 90, 92]

report = MemoryProfiler.report do
  FIBO_WANTED_NUMBERS.each do |n|
    RecursiveProcess.factorial(n)
  end
end

report.pretty_print


# report = MemoryProfiler.report do
#   FIBO_WANTED_NUMBERS.each do |n|
#     IterativeProcess.factorial(n)
#   end
# end

# report.pretty_print