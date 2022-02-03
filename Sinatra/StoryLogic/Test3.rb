puts "Enter a story, terminated by an empty line:"
story = ""
until (line = gets).chomp.empty?
  story << line
end
 
story.scan(/\[(\w*:*\w)]/i).uniq.each do |var|
  print "Enter a value for '#{var}': "
  story.gsub!(/<#{var}>/, gets.chomp)
end
 
puts
puts story