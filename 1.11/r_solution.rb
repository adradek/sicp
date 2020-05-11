module RSolution
  class << self
    def f(n)
      return n if n < 3
      f(n - 1) + f(n - 2) + f(n - 3)
    end
  end
end

(1..10).each do |n|
  puts "f(#{n}) => #{RSolution.f(n)}" 
end