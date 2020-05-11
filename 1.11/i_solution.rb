module ISolution
    class << self
      def f(n)
        return n if n <= 3
        f_iter(1, 2, 3, n - 4)
      end

      def f_iter(nx3, nx2, nx1, cnt)
        nx0 = nx1 + nx2 + nx3
        return nx0 if cnt == 0
        f_iter(nx2, nx1, nx0, cnt - 1)
      end
    end
  end
  
  (1..10).each do |n|
    puts "f(#{n}) => #{ISolution.f(n)}" 
  end