play = true
while play == true
	num_guesses = 0
	answer = rand(1..1000)
	puts answer
	 
	puts "I'm thinking of a random number from 1 to 1000" 
	puts "Can you guess it?"
	loop do
		print "Type in your guess: "
		guess = gets.chomp.to_i
		  
		num_guesses += 1  
		unless guess == answer 
			message = if guess > answer 
				"Too high" 
			else 
				"Too low" 
			end 
			puts message 
		else 
			puts "You got it!" 
			puts "It took you #{num_guesses} guesses." 
			break 
		end
	end
	print "Would you like to play again? (y/n): "
	again = gets.chomp!
	if again == 'n'
		play = false
		puts "Ok, Bye!"
		exit
	elsif again == 'y'
		play = true
	end
end
