require 'Date'

class Holiday	
	def printHoliday
		puts @my_date.strftime("#{@name} is on %A, %B %d in %Y")
	end
end
 
class FixedHoliday < Holiday
	def initialize(name, month, day, year=2016)
		@name = name
		@month = month
		@day = day
		@year = year
		@my_date = Date.new(year, month, day)
	end
end
  
#=begin
class MovingHoliday < Holiday
    def initialize (name, month, day_of_week, week, year=2016)
        @name = name
        @month = month
        @day_of_week = day_of_week
        @week = week
        @year = year
        @my_date = Date.new(year, month, 1)
        @my_date += 1 while !@my_date.send("#{day_of_week}?")
        @my_date += (7 * (week - 1))
    end  
end
#=end

print "What year would you like to check? "
year = gets.to_i

newYears_day = FixedHoliday.new("New Year's Day", 1, 1, year)
halloween = FixedHoliday.new("Halloween", 10, 31, year)
christmas_day = FixedHoliday.new("Christmas Day", 12, 25, year)
independence_day = FixedHoliday.new("Independence Day", 7, 4, year)
mothers_day = MovingHoliday.new("Mother's Day", 5, "sunday", 2, year)
fathers_day = MovingHoliday.new("Fathers Day", 6, "sunday", 3, year)
thanks_giving = MovingHoliday.new("Thanks Giving", 11, "thursday", 4, year)

newYears_day.printHoliday
halloween.printHoliday
christmas_day.printHoliday
independence_day.printHoliday
mothers_day.printHoliday
fathers_day.printHoliday
thanks_giving.printHoliday
