=begin
print "Enter your grade: "
grade = gets.chomp
case grade
when "A"
	puts 'Well done!'
when "B"
	puts 'Try harder!'
when "C"
	puts 'You need help!!!'
when "D","F"
	puts 'You are going to fail'
else
  puts "You just making it up!"
end
=end
=begin
print "Enter your grade: "
grade = gets.chomp
if "A" === grade
	puts 'Well done!'
elsif "B" === grade
	puts 'Try harder!'
elsif "C" === grade
	puts 'You need help!!!'
elsif "D" === grade || "F" === grade
	puts 'You are going to fail'
else
  puts "You just making it up!"
end
=end
=begin
print "Enter a number: "
n = gets.to_i
case n
when 0
  puts 'You typed zero'
when 1, 9
  puts 'n is a perfect square'
when 2
  puts 'n is a prime number'
  puts 'n is an even number'
when 3, 5, 7
  puts 'n is a prime number'
when 4, 6, 8
  puts 'n is an even number'
else
  puts 'Only single-digit numbers are allowed'
end
=end
=begin
score = 70

result = case score
   when 0..40 then "Fail"
   when 41..60 then "Pass"
   when 61..70 then "Pass with Merit"
   when 71..100 then "Pass with Distinction"
   else "Invalid Score"
end

puts result
=end
=begin
case a
when 1
  puts "Single value"
when 2, 3
  puts "One of comma-separated values"
when 4..6
  puts "One of 4, 5, 6"
when 7...9
  puts "One of 7, 8, but not 9"
else
  puts "Any other thing"
end
=end
=begin
obj = 1
case obj  # was case obj.class
when String
  print('It is a string')
when Fixnum
  print('It is a number')
else
  print('It is not a string')
end
=end

