defmodule Umnozhaka do
  def calc(a, b) do
    calc_iter(a, b, 0)
  end

  def calc_iter(0, _, _), do: 0
  def calc_iter(_, 0, _), do: 0
  def calc_iter(a, 1, buf), do: a + buf
  def calc_iter(a, b, buf) when rem(b, 2) == 0, do: calc_iter(double(a), halve(b), buf)
  def calc_iter(a, b, buf) do
    calc_iter(a, b - 1, buf + a)
  end

  def double(x), do: x + x
  def halve(x), do: div(x, 2)
end

Enum.each([[12, 8], [9, 6], [3, 11], [16, 16]], fn(arr) ->
  [a, b] = arr
  IO.puts "#{a} * #{b} = #{Umnozhaka.calc(a, b)}"
end)
