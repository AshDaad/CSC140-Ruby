=begin
def my_method(**options)
  puts options.inspect
end

my_method(key: "value")
=end


def double_splat(**hash)
	hash.each do |key,value|
		puts "My key of #{key} has a value of #{value}"
	end
end

# double_splat.each do |key,value|
	# puts "My key of #{key} has a value of #{value}"
# end

double_splat(a: 1, b: 2)

