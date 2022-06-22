# This require relative is to call the checkout file
require_relative "./checkout"

### Talking with the user ###
puts "What's your year of birth?"
birth_year = gets.chomp.to_i

puts "What's your month of birth?"
birth_month = gets.chomp.to_i

puts "What's your day of birth?"
birth_day = gets.chomp.to_i
#############################

puts "Computing your age (with the most complicated algorithms)........"

# TODO: This is probably where you'd like to use your brand new function!
calculated_age = age_in_days(birth_day,birth_month,birth_year)

# Finally, print user's age in days:
puts "You are #{calculated_age} days old... phew!"
