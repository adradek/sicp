defmodule Akkerman do
  def a(_, y) when y == 0, do: 0
  def a(x, y) when x == 0, do: 2 * y
  def a(_, y) when y == 1, do: 2
  def a(x, y) do
    a(x - 1, a(x, y - 1))
  end
end

IO.puts "Akkerman 1 10 => #{Akkerman.a(1, 10)}"
IO.puts "Akkerman 2 4 => #{Akkerman.a(2, 4)}"
IO.puts "Akkerman 3 3 => #{Akkerman.a(3, 3)}"