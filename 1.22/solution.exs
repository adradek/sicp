Code.require_file("../1.21/smallest_divisor.exs")

defmodule TimedPrimeTest do
  def search_for_primes(_, 0), do: nil
  def search_for_primes(number, count) do
    if prime?(number) do
      report(number)
      search_for_primes(number + 1, count - 1)
    else
      search_for_primes(number + 1, count)
    end
  end

  def prime?(number), do: number == SmallestDivisor.calc(number)

  def report(number) do
    {time, _result} = :timer.tc(TimedPrimeTest, :prime?, [number])
    IO.puts "#{number} is prime, time: #{time} mks"
  end
end

Enum.each((0..13), fn(num) ->
  TimedPrimeTest.search_for_primes(1000 * :math.pow(10, num) |> round, 3)
end)
