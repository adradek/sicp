module SmallestDivisor
	class << self
		def calc(n)
			find_divisor(n, 2)
		end

		def find_divisor(n, divisor)
			return n if divisor ** 2 > n
			return divisor if divides?(n, divisor)
			find_divisor(n, divisor + 1)
		end

		def divides?(number, divisor)
			number % divisor == 0
		end
	end
end

[199, 1999, 19999, 32, 81, 17, 349, 369, 121, 777, 12321].each do |n|
	puts "The smallest divisor for #{n} is #{SmallestDivisor.calc(n)}"
end
