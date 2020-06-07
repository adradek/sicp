Code.require_file("../1.24/elixir/fermat_fast_test.exs")

defmodule CheckFermatCompletely do
  def passes?(number), do: passes_iter(number, 1)

  def passes_iter(number, number), do: true
  def passes_iter(number, base) do
    if FermatFastTest.expmod(base, number, number) != base do
      false
    else
      passes_iter(number, base + 1)
    end
  end
end

carmichael_numbers = [ 561, 1105, 1729, 2465, 2821, 6601 ]

Enum.each(carmichael_numbers, fn(cn) ->
  IO.puts "Number #{cn} passes the test: #{CheckFermatCompletely.passes?(cn)}"
end)