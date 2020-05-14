defmodule Power do
  def calc(number, power) do
    calc_iter(number, power, 1)
  end

  def calc_iter(number, 1, coef) do
    IO.puts "final iter!"
    number * coef
  end

  def calc_iter(number, power, coef) when rem(power, 2) == 1 do
    IO.puts "iter -1"
    calc_iter(number, power - 1, coef * number)
  end
      
  def calc_iter(number, power, coef) do      
    IO.puts "iter :2"
    calc_iter(number * number, div(power, 2), coef)
  end
end

IO.puts "10^5 -> #{Power.calc(10, 5)}\n"
IO.puts "2^8 -> #{Power.calc(2, 8)}\n"
IO.puts "3^7 -> #{Power.calc(3, 7)}\n"
IO.puts "10^8 -> #{Power.calc(10, 8)}\n"
IO.puts "2^9 -> #{Power.calc(2, 9)}\n"
IO.puts "4^3 -> #{Power.calc(4, 3)}\n"
IO.puts "11^5 -> #{Power.calc(11, 5)}"
