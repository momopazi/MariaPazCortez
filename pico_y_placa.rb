require 'date'
require 'time'
class Date
  def dayname
     DAYNAMES[self.wday]
  end
end
class Auto
attr_accessor :plate, :weeDay, :hourDAY
include Comparable
	def initialize(plate, weeDay, hourDAY)
		@plate=plate
		@weeDay=weeDay
		@hourDAY=hourDAY
	end
	def DriveOrDont
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
plaN=gets.chomp.reverse
while !['1','2','3','4','5','6','7','8','9','0'].include?(plaN[0]) || plaN.length != 6 && plaN.length != 7 
	puts "Please insert a valid plate number"
	plaN=gets.chomp.reverse
end
puts "Your last plate number is: "+plaN[0]


puts "Please insert a valid date and use YYYY/MM/DD format"
inp = gets.chomp
begin
 	while inp.length != 10 || inp[0..3].to_i < 2010 || inp[5..6].to_i > 12 || inp[8..9].to_i>31 || !['/','-'].include?(inp[4]) || !['/','-'].include?(inp[7])
  		puts "Please insert a valid date and use YYYY/MM/DD format"
 		inp = gets.chomp
 	end
	today = Date.parse(inp)
	uWeeDay=today.dayname.to_s
	puts "The weekday of your date is: "+uWeeDay
rescue Exception => e
  puts inp.to_s+" is not a valid date. Stick to the format given and try again."
  system ("ruby pico_y_placa.rb")
end


puts "Please insert the time of the day and use de hh:mm format (24H)"
utime=gets.chomp
begin
	while utime.length != 5 || utime[0..1].to_i>23 || utime[3..4].to_i>59 || utime[2] != ':'
		puts "Please insert a valid time of the day using de hh:mm format (24H)"
		utime=gets.chomp
	end
	Time.parse(utime)
rescue Exception => e
	puts utime.to_s+" is not a valid time. Stick to the format given and try again."
	system ("ruby pico_y_placa.rb")
end


car = Auto.new(plaN[0],uWeeDay,utime)
puts "Car's last plate numer: "+car.plate.to_s + " | Weekday: "+car.weeDay.to_s + " | Hour: " +car.hourDAY.to_s
car.DriveOrDont