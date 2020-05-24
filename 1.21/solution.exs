Code.require_file("smallest_divisor.exs")

Enum.each([199, 1999, 19999, 32, 81, 17, 349, 89 * 89], fn(num) ->
  IO.puts "The smallest divisor for #{num} is #{SmallestDivisor.calc(num)}"
end)
