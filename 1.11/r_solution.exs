defmodule RSolution do
  def f(n) when n < 3, do: n
  def f(n) do
    f(n - 1) + f(n - 2) + f(n - 3)
  end
end

Enum.each(1..10, fn(n) ->
  IO.puts "f(#{n}) => #{RSolution.f(n)}"
end)
