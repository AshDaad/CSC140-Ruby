def calculate(a, b, c)
	return (a+b)*c
end

example1 = calculate(1,2,3) #9
puts example1
example2 = calculate([1], [2,3], 2)
puts "#{example2}"
example3 = calculate("apples", "and oranges ", 3)
puts "#{example3}"