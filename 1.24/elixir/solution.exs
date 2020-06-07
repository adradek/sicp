Code.require_file("fermat_fast_test.exs", __DIR__)

defmodule TimedFermatPrimeTest do
  def search_for_primes(_, 0), do: nil
  def search_for_primes(number, count) do
    if FermatFastTest.prime?(number) do
      report(number)
      search_for_primes(number + 1, count - 1)
    else
      search_for_primes(number + 1, count)
    end
  end

  def report(number) do
    {time, _result} = :timer.tc(FermatFastTest, :prime?, [number])
    IO.puts "#{number} is prime, time: #{time} mks"
  end
end

Enum.each((0..13), fn(num) ->
  TimedFermatPrimeTest.search_for_primes(1000 * :math.pow(10, num) |> round, 3)
end)
