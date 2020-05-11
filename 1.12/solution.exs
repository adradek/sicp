defmodule Binom do
  def calc(row) do
    calc_iter(row, 1)
  end

  def calc_iter(row, cnt) when cnt > row, do: IO.puts "#{calc_elem(row, cnt)} "
  def calc_iter(row, cnt) do
    IO.write "#{calc_elem(row, cnt)} "
    calc_iter(row, cnt + 1)
  end

  def calc_elem(row, element) when element < 1 or element > row + 1, do: 0

  def calc_elem(1, _) do
    1
  end

  def calc_elem(row, element) do
    calc_elem(row - 1, element - 1) + calc_elem(row - 1, element)
  end
end

Enum.each(1..10, fn(degree) ->
  IO.puts "Degree: #{degree}"
  Binom.calc(degree)
  IO.puts "=================="
end)
