class Madlib

	def initialize(txt)
		@questions = []
		@story_parts = []
		@input_list = []
		@input = []

		stored = {}

		txt.gsub(/\[(\w*:*\w)]/i).to_a.each do |item|
			if item[0] == ?(
				item = item[1..-2].gsub("\n", ' ')
				if item.index(':')
					name, question = item.split(':')
					stored[name] = @questions.length
					@questions << question
				else
					name, question = item, item
				end
				@answer_list << (stored[name] || @questions.length)
				@questions << question unless stored[name]
			else
				@story_parts << item
			end
		end
	end

	def list_questions(&block)
		@questions.each_index do |i|
			yield(i, @questions[i])
		end
	end

	def answer_question(i, answer)
		@input[i] = answer
	end

	def show_result
		real_answers = @answer_list.collect {|i| @input[i]}
		@story_parts.zip(real_answers).flatten.compact.join
	end
end


madlib = Madlib.new(IO.read(ARGV.shift))
input = []
madlib.list_questions do |i, q|
  print "Give me " + q + ": "
  answers[i] = gets.strip
end
answers.each_index {|i| madlib.answer_question(i, answers[i]) }
puts madlib.show_result