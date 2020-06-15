defmodule Integral do
  def simple(f, a, b, dx) do
    add_dx = fn x -> x + dx end
    Sum.calc(f, a + dx / 2, add_dx, b) * dx
  end

  def simpson(f, a, b, n) do
    h = (b - a) / n
    add_h = fn x -> x + h end

    simpson_member = (fn(x) ->
      k = round((x - a) / h)

      coef = cond do
        k == 0 || k == n -> 1
        rem(k, 2) == 0   -> 2
        true             -> 4
      end
      
      # IO.puts "k=#{k}, coef=#{coef}, member=#{coef * f.(x)}"
      coef * f.(x)
    end)

    Sum.calc(simpson_member, a, add_h, b) * h / 3
  end
end

defmodule Sum do
  def calc(term, a, next, b) do
    if (a - b) > (next.(a) - a) * 0.3 do
      0
    else
      term.(a) + calc(term, next.(a), next, b)
    end
  end
end