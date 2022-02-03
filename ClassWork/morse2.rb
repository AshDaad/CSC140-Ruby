
class Morse
	attr_reader :message, :result

	SymbolsToMorse = {
			A: '.-', B: '-...', C: '-.-.', D: '-..',
			E: '.', F: '..-.', G: '--.', H: '....',
			I: '..', J: '.---', K: '-.-', L: '.-..',
			M: '--', N: '-.', O: '---', P: '.--.',
			Q: '--.-', R: '.-.', S: '...', T: '-',
			U: '..-', V: '...-', W: '.--', X: '-..-',
			Y: '-.--', Z: '--..', ' ': ' ' , '1': '.----',
			'2': '..---', '3': '...--', '4': '....-', '5': '.....',
			'6': '-....', '7': '--...', '8': '---..', '9': '----.',
			'0': '-----'
	}
	
	MorseToSymbols = SymbolsToMorse.invert
		
	def self.code(text)
		text = text.upcase!
		str = ""
		message = ""
		text.each_char.map do |c|
			ascii_check = c.ord
			if ascii_check.between?(65,90)
				str += text[c]
			elsif ascii_check.between?(48,57)	
				# str += "N".concat(text[c])
				str += text[c]
			elsif ascii_check ===(32)
				str += text[c]
			end
			message += "#{SymbolsToMorse[c.to_sym]} "
		end
		# message = message.each.map.join(",")
		# text.each_char.map { |c| SymbolsToMorse[((c =~ /\d/) ? "N#{c}" : c).to_sym] }
	  # print text.to_s
	end

	def self.decode(morse)
	  morse.map { |m| MorseToSymbols[m].to_s[-1] }.join(' ')
	end

	# def self.read_file
		# # @Temp = File.read("preamble_encode.txt").chomp
		  # # File.open('hiscore.txt'){|f| f.lines.map{|l| l.chomp!.split(',')}}
		# # @Temp = File.foreach("preamble_encode.txt", 'r') {|f| f.lines.map{|l| l.chomp}}
		
	# end

	# def self.write_file
		# # Temp2 = File.open('preamble_decode.txt', 'w') do |f|
			# # f.puts Temp2
		# # end
	# end

end


test = "Abc 1oL!"
output1 = Morse.code(test)
output2 = Morse.decode(output1)

print output1
puts "\n\n"
print output2