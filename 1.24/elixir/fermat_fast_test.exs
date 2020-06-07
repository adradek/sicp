defmodule FermatFastTest do
  def prime?(number) do
    fast_prime?(number, 1)
  end

  def fast_prime?(_, 0), do: true
  def fast_prime?(number, attempts) do
    if (fermat_test(number)) do
      fast_prime?(number, attempts - 1)
    else
      false
    end
  end

  def fermat_test(number) do
    random_base = :rand.uniform(number - 1)
    random_base == expmod(random_base, number, number)
  end

  def expmod(_, 0, _), do: 1
  def expmod(base, exp, m) when rem(exp, 2) == 0 do
    exm = expmod(base, div(exp, 2), m)
    rem(exm * exm, m)
  end
  def expmod(base, exp, m), do: rem(base * expmod(base, exp - 1, m), m)
end