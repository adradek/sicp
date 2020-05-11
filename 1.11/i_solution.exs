defmodule ISolution do
  def f(n) when n <= 3, do: n
  def f(n) do
    f_iter(1, 2, 3, n - 4)
  end

  def f_iter(nx3, nx2, nx1, cnt) when cnt == 0, do: nx1 + nx2 + nx3
  def f_iter(nx3, nx2, nx1, cnt) do
    f_iter(nx2, nx1, nx3 + nx2 + nx1, cnt - 1)
  end
end

Enum.each(1..10, fn(n) ->
  IO.puts "f(#{n}) => #{ISolution.f(n)}"
end)
