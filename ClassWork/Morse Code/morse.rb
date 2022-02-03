=begin
	Name: Alex Fritz
=end

class Morse
	attr_reader :message
	attr_writer :result

	@morse = {
			A: '.-', B: '-...', C: '-.-.', D: '-..',
			E: '.', F: '..-.', G: '--.', H: '....',
			I: '..', J: '.---', K: '-.-', L: '.-..',
			M: '--', N: '-.', O: '---', P: '.--.',
			Q: '--.-', R: '.-.', S: '...', T: '-',
			U: '..-', V: '...-', W: '.--', X: '-..-',
			Y: '-.--', Z: '--..', ' ': ' ' , N1: '.----',
			N2: '..---', N3: '...--', N4: '....-', N5: '.....',
			N6: '-....', N7: '--...', N8: '---..', N9: '----.',
			N0: '-----'
		}
		@chars_to_morse = @morse.each_with_object({}) { |(k,v),h| h[k.to_s[-1]] = v }
		@morse_to_chars = @chars_to_morse.invert
		
	def self.encode(file_name)
		message = read_file(file_name)
		encoded = ""
		message = message.upcase!
		message.each_char do |c|
			ascii_check = c.ord
			if ascii_check.between?(65,90)
				temp = message[c].to_sym
				encoded += "#{@morse[temp]}" + " "
			elsif ascii_check.between?(48,57)	
				temp = "N".concat(message[c]).to_sym
				encoded += "#{@morse[temp]}" + " "
			elsif ascii_check ===(32)
				temp = message[c].to_sym
				encoded += "#{@morse[temp]}"
			end
		end
		@result = encoded
		file = "#{file_name}"
		write_file("#{file}-encode.txt", @result)
	end

	def self.decode(file_name)
		message = read_file("#{file_name}-encode")
		@decoded = ""
		arr = []
		arr = message.split('  ')
		arr = arr.map! do |i|
			i.split(' ') + [' ']
		end
			
		arr.each do |r|
			r.each do |i|
				@decoded += "#{@morse_to_chars[i].to_s[-1]}"
			end
		end				
		@result = @decoded
		file = "#{file_name}"
		write_file("#{file}-decode.txt", @result)
	end

	def self.read_file(file_name)
		file = "#{file_name}.txt"
		@message = File.read(file)
	end

	def self.write_file(file_name, result)
		tFile = File.open(file_name, 'w') do |f|
			f.puts @result
		end
	end

end

case ARGV[0].to_s
when "encode"
	Morse.encode(ARGV[1].to_s)
when "decode"
	Morse.decode(ARGV[1].to_s)
end



