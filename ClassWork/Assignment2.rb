class HiScore
    attr_reader :hiscore
 
    def initialize
        @hiscore = if File.exist?('hiscore.txt')
            read_file
        else
            build_new
        end
    end
     
    def show
        puts "Top 5 Scores"
        @hiscore.each do |r|
          puts r.each { |p| p }.join(" ")
        end
    end
     
    def build_new
        @scoreList = Array.new(5) {[1000, '--']}
    end
 
    def read_file()
        @hiscore = File.read("hiscore.txt").chomp
        process_data(@hiscore)
    end
 
    def process_data(instance)
        @scoreList = @hiscore.split(",").to_a 
        @scoreList = @scoreList.each_slice(2).to_a
    end
 
    def check(score)
		max = @scoreList[4][0].to_i
		if score > max
			puts "Sorry you didn't make the list."
		else
			add_name(score)
		end
    end
     
    def add_name(score)
		puts "You made it into the Top 5!"
        print "Enter your name: "
        @name = gets.chomp!.to_s
		@scoreList.push([score, @name]).sort!{|s1, s2| s1[0].to_i <=> s2[0].to_i}.pop
		write_file(@scoreList)
		
    end
     
    def write_file(array)
        array = @scoreList.join(",")
        scorefile = File.open('hiscore.txt', 'w')
            scorefile.print "#{array}"
		scorefile.close
    end
 
end
 
def start
    play = true
    while play == true
        num_guesses = 0
        answer = rand(1..1000)
        puts answer
		puts "***NUMBER GUESS***\n"
         
        @game.show
		puts "\nI'm thinking of a random number from 1 to 1000"
          
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
                @score = num_guesses
                @game.check(@score)
 
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
end

@game = HiScore.new()
start()