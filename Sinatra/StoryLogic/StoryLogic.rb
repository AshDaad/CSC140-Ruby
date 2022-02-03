class MadLib
	def initialize(input)
		@input_string = read_file(input)
		p @parsed_inputs = parse(@input_string)
		@hashed_input_values = {}
	end
	  
	def take_input
		@parsed_inputs.each do |key|
		parse_key = key.match(/:/)
		if parse_key
			print "Enter #{parse_key.post_match}: "
			value = STDIN.gets.chomp
			@hashed_input_values["[#{key}]"] = value
			@hashed_input_values["[#{parse_key.pre_match}]"] = value
			@parsed_inputs.delete(parse_key.pre_match)
		else
			print "Enter #{key}: "
			@hashed_input_values["[#{key}]"] = STDIN.gets.chomp
			p @hashed_input_values
		end
		end
	   @hashed_input_values
	end
  
	def print_output
		@input_string.gsub(/\[(\w*:*\w)]/i, @hashed_input_values)
	end
  
	def parse(input)
		# f = File.open(input)
		input.scan(/\[(\w*:*\w)]/i).flatten
	end
 
	def read_file(file_name)
		file = File.read(file_name)
	end
  private :parse
  
end


madlib = MadLib.new(ARGV[0])
madlib.take_input
puts "#{madlib.print_output}"