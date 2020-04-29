defmodule Cubert do
  def calc(number) do
    iter_calc(number, 1)
  end

  def iter_calc(number, guess) do
    if good_enough?(number, guess) do
      guess
    else
      iter_calc(number, improve(number, guess))
    end
  end

  def good_enough?(number, guess) do
    abs(number - guess * guess * guess) < 0.00001 * number
  end

  def improve(number, guess) do
    (number / (guess * guess) + 2 * guess) / 3.0
  end
end

IO.puts "27 => #{Cubert.calc(27)}"
IO.puts "8 => #{Cubert.calc(8)}"
IO.puts "64 => #{Cubert.calc(64)}"
IO.puts "125 => #{Cubert.calc(125)}"
IO.puts "200 => #{Cubert.calc(200)}"
IO.puts "0.000001 => #{Cubert.calc(0.000001)}"
