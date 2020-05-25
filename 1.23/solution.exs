Code.require_file("../1.21/smallest_divisor.exs")

defmodule BetterSmallestDivisor do
  def calc(n), do: find_divisor(n, 2)

  def find_divisor(n, d) when d * d > n, do: n
  def find_divisor(n, d) when rem(n, d) == 0, do: d
  def find_divisor(n, d), do: find_divisor(n, next_d(d))

  def next_d(2), do: 3
  def next_d(d), do: d + 2
end

primes = [
  10000019, 10000079, 10000103,
  100000007, 100000037, 100000039,
  1000000007, 1000000009, 1000000021,
  10000000019, 10000000033, 10000000061
]

Enum.each(primes, fn(prime) ->
  { time_1, prime } = :timer.tc(SmallestDivisor, :calc, [prime])
  { time_2, prime } = :timer.tc(BetterSmallestDivisor, :calc, [prime])

  IO.puts "Prime #{prime}: old took #{time_1 / 1000}ms, new took #{time_2 / 1000}ms (#{time_1 / time_2} x faster)"
end)