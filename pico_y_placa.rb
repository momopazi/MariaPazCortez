require 'date'
require 'time'
class Date 
	#This class is used to convert any Date paremeter into a weekday name
  def dayname
     DAYNAMES[self.wday]
  end
end
class Auto
attr_accessor :plate, :weeDay, :hourDAY
#This class creates de "Auto" object, with the three inputs specified
	def initialize(plate, weeDay, hourDAY) 
		@plate=plate
		@weeDay=weeDay
		@hourDAY=hourDAY
	end
	def DriveOrDont #this is a method used to compare the user's inputs to determine if their car can be on the road or not
		if weeDay == 'Monday' && ['1','2'].include?(plate)
			if Time.parse(hourDAY)>=Time.parse("07:00") && Time.parse(hourDAY)<=Time.parse("09:30") || Time.parse(hourDAY)>=Time.parse("16:00") && Time.parse(hourDAY)<=Time.parse("19:30")
				puts "Your car can't be on the road."
			end
		elsif weeDay == 'Tuesday' && ['3','4'].include?(plate)
			if Time.parse(hourDAY)>=Time.parse("07:00") && Time.parse(hourDAY)<=Time.parse("09:30") || Time.parse(hourDAY)>=Time.parse("16:00") && Time.parse(hourDAY)<=Time.parse("19:30")
				puts "Your car can't be on the road."
			end
		elsif weeDay == 'Wednesday' && ['5','6'].include?(plate)
			if Time.parse(hourDAY)>=Time.parse("07:00") && Time.parse(hourDAY)<=Time.parse("09:30") || Time.parse(hourDAY)>=Time.parse("16:00") && Time.parse(hourDAY)<=Time.parse("19:30")
				puts "Your car can't be on the road."
			end
		elsif weeDay == 'Thursday' && ['7','8'].include?(plate)
			if Time.parse(hourDAY)>=Time.parse("07:00") && Time.parse(hourDAY)<=Time.parse("09:30") || Time.parse(hourDAY)>=Time.parse("16:00") && Time.parse(hourDAY)<=Time.parse("19:30")
				puts "Your car can't be on the road."
			end
		elsif weeDay == 'Friday' && ['9','0'].include?(plate)
			if Time.parse(hourDAY)>=Time.parse("07:00") && Time.parse(hourDAY)<=Time.parse("09:30") || Time.parse(hourDAY)>=Time.parse("16:00") && Time.parse(hourDAY)<=Time.parse("19:30")
				puts "Your car can't be on the road."
			end
		else 
			puts "Your car can be on the road."
		end
	end
end


puts "Please insert your plate number"
plaN=gets.chomp.reverse #the string is being reversed so that it is easier to retrieve the last number, since number plates can variate in lenght
#In the "while" below, the user's input is being validated to make sure the first (last) character is a number and the length is correct
#Nothing more is being validated since the last number is the only important parameter needed
while !['1','2','3','4','5','6','7','8','9','0'].include?(plaN[0]) || plaN.length != 6 && plaN.length != 7 
	puts "Please insert a valid plate number"
	plaN=gets.chomp.reverse
end
puts "Your last plate number is: "+plaN[0]


puts "Please insert a valid date and use YYYY/MM/DD format"
inp = gets.chomp
begin #An exception manager is being used because of the unit conversions, to stop the programm from crashing if the user inputs inadecuate parameter
 	#In the while below, the user's input is being validated to make sure it complies with an acceptable format to be converted into date
	#Note: The program will only take years later than 2010, wich is when the "Pico y placa" system started functioning
	while inp.length != 10 || inp[0..3].to_i < 2010 || inp[5..6].to_i > 12 || inp[8..9].to_i>31 || !['/','-'].include?(inp[4]) || !['/','-'].include?(inp[7])
  		puts "Please insert a valid date and use YYYY/MM/DD format"
 		inp = gets.chomp
 	end
	#The String today is converted into a Date
	today = Date.parse(inp)
	#Using the method from the class Date, a weekday name can be retrieved from any date input
	uWeeDay=today.dayname.to_s
	puts "The weekday of your date is: "+uWeeDay
rescue Exception => e
	#in case something goes wrong, the user will be told it's input was no good and the program will restart
	#note: it is important for the program's name not to be changed  
  	puts inp.to_s+" is not a valid date. Stick to the format given and try again."
  	system ("ruby pico_y_placa.rb")
end


puts "Please insert the time of the day and use de hh:mm format (24H)"
utime=gets.chomp
begin
	#similar to the validations above, the user's input is being checked so that it complies with a valid format
	while utime.length != 5 || utime[0..1].to_i>23 || utime[3..4].to_i>59 || utime[2] != ':'
		puts "Please insert a valid time of the day using de hh:mm format (24H)"
		utime=gets.chomp
	end
	Time.parse(utime)
rescue Exception => e
	#in case something goes wrong, the user will be told it's input was no good and the program will restart
	#note: it is important for the program's name not to be changed  
	puts utime.to_s+" is not a valid time. Stick to the format given and try again."
	system ("ruby pico_y_placa.rb")
end

#The object "car" is being created, using the three inputs given by the user
car = Auto.new(plaN[0],uWeeDay,utime)
puts "Car's last plate numer: "+car.plate.to_s + " | Weekday: "+car.weeDay.to_s + " | Hour: " +car.hourDAY.to_s
#the method that checks and tells the answer to wether or not the user can use it's car is being called
car.DriveOrDont
