module Akkerman
  def self.a(x, y)
    return 0 if y == 0
    return 2 * y if x == 0
    return 2 if y == 1
    a(x - 1, a(x, y - 1))
  end
end

puts "Akkerman 1 10 => #{Akkerman.a(1, 10)}"
puts "Akkerman 2 4 => #{Akkerman.a(2, 4)}"
puts "Akkerman 3 3 => #{Akkerman.a(3, 3)}"