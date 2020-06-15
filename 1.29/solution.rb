require_relative "integrals.rb"

cube = -> (x) { x * x * x }

puts "\n\nSimple:\n\n"

[0.01, 0.001].each do |step|
  result = Integral.simple(cube, 0, 1, step)
  error = (0.25 - result).abs
  puts "Simple Cube #{step}: #{result}, err: #{error}"
end

puts "\n\nSimpson:\n\n"

[2, 10, 100, 1000, 5000, 200].sort.each do |steps|
  result = Integral.simpson(cube, 0, 1, steps)
  error = (result - 0.25).abs
  puts "Simpson Cube n=#{steps}: #{result}, err: #{error}"
end
