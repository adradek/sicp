defmodule MillerRabin do
  def prime?(_, 0), do: true
  def prime?(n, times) do
    miller_rabin_test(n) && prime?(n, times - 1)
  end

  def miller_rabin_test(n) do
    base = :rand.uniform(n - 2) + 2
    expmod_plus(base, n - 1, n) == 1
  end

  def expmod_plus(_, 0, _), do: 1
    
  def expmod_plus(a, exp, n) when rem(exp, 2) == 0 do
    zero_or_expmod(a, exp, n)
  end

  def expmod_plus(a, exp, n) do
    rem(a * expmod_plus(a, exp - 1, n), n)
  end

  def zero_or_expmod(a, exp, n) do
    halved = expmod_plus(a, div(exp, 2), n)
    res = rem(halved * halved, n)
    
    if res == 1 && halved != 1 && halved != (n - 1) do
      0 
    else
      res
    end
  end
end

Enum.each([37, 63, 19, 117, 109, 43, 2465, 2821, 6601], fn(num) ->
  IO.puts "Num: #{num} is prime: #{MillerRabin.prime?(num, 4)}"
end)