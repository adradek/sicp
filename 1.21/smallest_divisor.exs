defmodule SmallestDivisor do
  def calc(n) do
    find_divisor(n, 2)
  end

  def find_divisor(n, d) when d * d > n, do: n
  def find_divisor(n, d) when rem(n, d) == 0, do: d
  def find_divisor(n, d), do: find_divisor(n, d + 1)
end