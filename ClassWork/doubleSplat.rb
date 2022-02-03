def store_person_info(name, age, **other_args)
	puts "Your name is #{name}"
	puts "Your age is: #{age}"
	puts "You also gave me the following information: "
	other_args.each { |label,info| puts "Your #{label} is #{info}"}
end

store_person_info("Jessie", 26, "Gender": "Female", "Hair color": "Blond", "Weight": 115, "Height": "4'11")