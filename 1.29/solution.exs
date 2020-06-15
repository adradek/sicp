Code.require_file("integrals.exs", __DIR__)


cube = fn(x) -> x * x * x end

IO.puts "Simple Cube 0.01: #{Integral.simple(cube, 0, 1, 0.01)}"
IO.puts "Simple Cube 0.001: #{Integral.simple(cube, 0, 1, 0.001)}"

IO.puts "Simpson Cube n=100: #{Integral.simpson(cube, 0, 1, 100)}"
IO.puts "Simpson Cube n=1000: #{Integral.simpson(cube, 0, 1, 12)}"