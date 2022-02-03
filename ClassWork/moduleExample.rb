puts Math::PI
include Math
puts PI


require 'Date'
puts Date::today

#multiline comment
=begin
hash = {
	key1 => value1,
	key2 => value2
}

hash = Hash.new
hash[key] = value
=end

grades = Hash.new
grades["Bob"] = 82
grades["jim"] = 94

puts grades["Jim"]


grades2 = {
	"Bob" => 82,
	"Jim" => 94
}

puts grades2["Jim"]

grades.each do |grade,name|
	puts "#{name} has a #{grade}"
end