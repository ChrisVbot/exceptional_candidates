# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'
require 'colorize'


# def get_input
#   while true
#     puts "Enter command"
#     input = gets.strip
#     candidates(input)
#   end
# end

# def candidates(candidates)
#   case candidates
    
#     when /find \d/
#       candidates.split.to_s
#       output = @candidates[/\d/]

      
      
#       # else
#       # output = "Candidate not found"
#     # when 'find 7'
#     #   output = @candidates[1]

#     # when 'find 9'
#     #   output = @candidates[2]

#     # when 'find 10'
#     #   output = @candidates[3]

#     # when 'find 11'
#     #   output = @candidates[4]

#     # when 'find 15'
#     #   output = @candidates[5]  

#     when 'quit'
#       puts 'Exiting program'
#       exit
    
#     when 'qualified'
#       output = qualified_candidates(@candidates).join("\n")

#     when 'all'
#       output = @candidates.join("\n")
    
#     else
#       output = "Command or ID not recognized"
#   end
#   puts "#{output}"
# end



# get_input
# Your test code can go here
# binding.pry
# pp qualified_candidates
@candidates.each do |candidate|
  begin
  if experienced?(candidate)
    puts "Candidate #{candidate[:id]} is experienced enough."
  else
    puts "Candidate #{candidate[:id]} is not experienced enough."
  end
  rescue InvalidCandidateError => ex
  puts "It could not be determined whether candidate #{candidate[:id]} is experienced enough."
  puts "The reason was: #{ex.message}"
  end
end


# @candidates.each do |id|
#   puts find(id)
# end

@candidates.each do |github_points|
  begin
  puts github(github_points) 
  rescue StandardError 
  puts "Candidates must have a github score of 100 or greater. Candidate #{github_points[:id]} does not qualify. " 
  end 
end

# @candidates.each do |langs|
#   puts languages(langs)
# end

@candidates.each do |date|
  begin
  puts applydate(date)
  rescue StandardError
  puts "Candidates must have applied within the past 15 days."
  end 
end

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


