# puts "it's time for Madlibs!!\n\n"

class Madlib
	def self.inputs(str)
		@addins=Hash.new do |h, add|
		   print "Give me a #{add.sub(/\[(\w*:*\w)\]/, "")}: "
		   h[$1]=$stdin.gets.chomp 
		end
	end
	
	def self.print_madlib(str)
		puts "",
		  File.read($story.sub(/\[(\w*:*\w)\]/,"")).gsub(/\[(\w*:*\w)\]/) {@addins[$1]}
	end
end

$story = "Story1.txt"
Madlib.inputs($story)
Madlib.print_madlib($story)