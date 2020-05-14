defmodule Summozvedenie do
  def fast_product(_, 0), do: 0
  def fast_product(0, _), do: 0

  def fast_product(a, 1) do
    a
  end

  def fast_product(a, b) when rem(b, 2) == 0 do
    fast_product(double(a), halve(b))
  end

  def fast_product(a, b) do
    a + fast_product(a, b - 1)
  end

  def double(number) do
    number + number
  end

  def halve(x) do
    div(x, 2)
  end
end

IO.puts "7 * 8 = #{Summozvedenie.fast_product(7, 8)}"
IO.puts "7 * 9 = #{Summozvedenie.fast_product(7, 9)}"
IO.puts "5 * 5 = #{Summozvedenie.fast_product(5, 5)}"
IO.puts "6 * 4 = #{Summozvedenie.fast_product(6, 4)}"
IO.puts "8 * 11 = #{Summozvedenie.fast_product(8, 11)}"
IO.puts "9000 * 8000 = #{Summozvedenie.fast_product(9000, 8000)}"