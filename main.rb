# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'
require 'colorize'


def get_input
  while true
    puts "Enter command"
    input = gets.strip
    return input
  end
end

def candidates(candidates)
  case candidates
    
    when 'find 5'
      output = @candidates[0]
    
    when 'find 7'
      output = @candidates[1]

    when 'find 9'
      output = @candidates[2]

    when 'find 10'
      output = @candidates[3]

    when 'find 11'
      output = @candidates[4]

    when 'find 15'
      output = @candidates[5]  

    when 'quit'
      puts 'Exiting program'
      exit
    
    when 'qualified'
      output = qualified_candidates(@candidates).join("\n")

    when 'all'
      output = @candidates.join("\n")
    
    else
      output = "Command or ID not recognized"
  end
  puts "#{output}"
end

def user_entry
  while true
    input = get_input
    output = candidates(input)
    #puts output
  end
end

user_entry
# Your test code can go here
# binding.pry
# pp qualified_candidates
# @candidates.each do |candidate|
#   puts experienced?(candidate)
# end

# @candidates.each do |id|
#   puts find(id)
# end

# @candidates.each do |github_points|
#   puts github(github_points)
# end

# @candidates.each do |langs|
#   puts languages(langs)
# end

# @candidates.each do |date|
#   puts applydate(date)
# end

# @candidates.each do |ages|
#   puts applyage(ages)
# end

# @candidates.each do |qual|
#  puts qualified_candidates(qual)
# end

# @candidates.each do |qualified|
#   puts qualified_candidates(qualified)
# end

# puts qualified_candidates(@candidates)


# puts @candidates