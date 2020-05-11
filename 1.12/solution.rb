module Binom
  class << self
    def calc(deep)
      calc_iter(deep, 1)
    end

    def calc_iter(deep, cnt)
      print "#{calc_elem(deep, cnt)} "
      return puts if cnt > deep
      calc_iter(deep, cnt + 1)
    end

    def calc_elem(deep, index)
      return 0 if index < 1 || index > deep + 1
      return 1 if deep == 1
      calc_elem(deep - 1, index - 1) + calc_elem(deep - 1, index)
    end
  end
end

# (1..10).each do |degree|
#   puts "Degree: #{degree}"
#   puts (1..degree + 1).map { |index| Binom.calc_elem(degree, index) }.join(" ")
#   puts "=================="
# end

(1..10).each do |degree|
  puts "Degree: #{degree}"
  Binom.calc(degree)
  puts "=================="
end