defmodule SumIter do
  def calc(a, b, term, nexta) do
    calc_iter(a, b, term, nexta, 0)
  end

  def calc_iter(a, b, _term, _nexta, sum) when a > b, do: sum

  def calc_iter(a, b, term, nexta, sum) do
    calc_iter(nexta.(a), b, term, nexta, sum + term.(a))
  end
end

itself = fn(x) -> x end
inc = fn (x) -> x + 1 end

IO.puts "Sum 1..20: #{SumIter.calc(1, 20, itself, inc)}"