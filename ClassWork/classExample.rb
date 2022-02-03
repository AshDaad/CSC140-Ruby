class Pet
	def initialize(name,weight,sound)
		@name = name
		@weight = weight
		@sound = sound
	end

	def speak
		puts "#{@sound}"
	end
	
	def display
		puts "I am #{@name} and I weigh #{@weight} pounds"
	end
end

class Dog < Pet
	attr_accessor :breed
	attr_accessor:sound
	def initialize(name="Frodo",weight=20,sound="Bark",breed="Mutt")
		@name = name
		@weight = weight
		@sound = sound
		@breed = breed
	end
	def do_trick
		puts "The #{@breed} did a trick"
	end
end

spot = Dog.new("Spot",49,"Bark","Dalmation")
spot.speak
spot.display
spot.do_trick
spot.breed="Pug"
puts "Spot is a #{spot.breed} and he #{spot.sound}s"