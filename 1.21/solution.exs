defmodule SmallestDivisor do
  def calc(n) do
    find_divisor(n, 2)
  end

  def find_divisor(n, d) when d * d > n, do: n
  def find_divisor(n, d) when rem(n, d) == 0, do: d
  def find_divisor(n, d), do: find_divisor(n, d + 1)
end

Enum.each([199, 1999, 19999, 32, 81, 17, 349, 89 * 89], fn(num) ->
  IO.puts "The smallest divisor for #{num} is #{SmallestDivisor.calc(num)}"
end)
