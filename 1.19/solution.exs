defmodule SlyFiba do
  def give_me_fibo(n) do
    iter(1, 0, 0, 1, n)
  end

  def iter(_, b, _, _, 0), do: b

  def iter(a, b, p, q, count) when rem(count, 2) == 0 do
    iter(a, b, q*q + p*p, q*(q + 2*p), div(count, 2))
  end

  def iter(a, b, p, q, count) do
    iter(q*(a + b) + p*a, q*a + p*b, p, q, count - 1)
  end
end

IO.puts "Fibo 1 = #{SlyFiba.give_me_fibo(1)}"
IO.puts "Fibo 2 = #{SlyFiba.give_me_fibo(2)}"
IO.puts "Fibo 3 = #{SlyFiba.give_me_fibo(3)}"
IO.puts "Fibo 4 = #{SlyFiba.give_me_fibo(4)}"
IO.puts "Fibo 5 = #{SlyFiba.give_me_fibo(5)}"
IO.puts "Fibo 13 = #{SlyFiba.give_me_fibo(13)}"
IO.puts "Fibo 40 = #{SlyFiba.give_me_fibo(40)}"