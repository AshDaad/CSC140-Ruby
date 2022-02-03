require_relative 'MyModule'

# class ModuleTester

	# def initialize
		# puts "#{MyModule::THIS_CONSTANT}"
		# MyModule::my_method
	# end
# end

class ModuleTester

	def initialize
		puts "#{MyModule::THIS_SUCC}"
		MyModule::my_solution
		MyModule::even_better
	end
end

ModuleTester.new