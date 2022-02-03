class MadLib
  def initialize(input)
    p @parsed_inputs = parse(input)
    if File.file?(input)
      fh = File.open(input)
      @input_string = fh.read
    else
    p  @input_string = input
    end
  p @hashed_input_values = {}
  end
  
  def take_input
    @parsed_inputs.each do |key|
      parse_key = key.match(/:/)
      if parse_key
        print "Enter #{parse_key.post_match} :"
        value = STDIN.gets.chomp
    p    @hashed_input_values["#{key}"] = value
    p    @hashed_input_values["#{parse_key.pre_match}"] = value
    p    @parsed_inputs.delete(parse_key.pre_match)
      else
        print "Enter #{key} :"
    p    @hashed_input_values["((#{key}))"] = STDIN.gets.chomp
      end
    end
  p @hashed_input_values
  end
  
  def print_output
    @input_string.gsub(/\(\(\w*:*\w+(?:\s*\w+)*\)\)/i, @hashed_input_values)
  end
  
  def parse(input)
    if File.file?(input)
      f = File.open(input)
    p  f.read.scan(/\(\((\w*:*\w+(?:\s*\w+)*)\)\)/i).flatten
    else
      input.scan(/\(\((\w*:*\w+(?:\s*\w+)*)\)\)/i).flatten
    end
  end
 
  private :parse
  
end

# madlib = MadLib.new(ARGV[0])
test = "Story2.txt"
madlib = MadLib.new(test)
madlib.take_input
puts "#{madlib.print_output}"