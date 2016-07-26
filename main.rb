# This is the main entrypoint into the program
# It requires the other files/gems that it needs

require 'pry'
require './candidates'
require './filters'
require 'colorize'


def ask
  while true
    puts "Enter command"
    input = gets.chomp.split
    command = input[0]
    argument = input[1]
  case command.downcase
    when "find"
      puts find(argument.to_i)
    when "all"
      puts @candidates.join("\n")
    
    when 'qualified'
      loop do
        begin
      puts qualified_candidates(@candidates).join("\n")
        rescue InvalidCandidateError
          puts "Candidates must have a :years_of_experience key."
        end
        break 
      end
    when 'quit'
    puts 'Exiting program'
    exit
    else
      puts "Command or ID not recognized"
      begin
    rescue InvalidCandidateError
      puts "Candidates require a :years_of_experience key"
    end
  end
end
end
  


# get_input
# Your test code can go here
# binding.pry
# pp qualified_candidates
# @candidates.each do |candidate|
#   begin
#   if experienced?(candidate)
#     puts "Candidate #{candidate[:id]} is experienced enough."
#   else
#     puts "Candidate #{candidate[:id]} is not experienced enough."
#   end
#   rescue InvalidCandidateError => ex
#   puts "It could not be determined whether candidate #{candidate[:id]} is experienced enough."
#   puts "The reason was: #{ex.message}"
#   end
# end


# @candidates.each do |id|
#   puts find(id)
# end

# @candidates.each do |github_points|
#   begin
#   puts github(github_points) 
#   rescue StandardError 
#   puts "Candidates must have a github score of 100 or greater. Candidate #{github_points[:id]} does not qualify. " 
#   end 
# end

# # @candidates.each do |langs|
# #   puts languages(langs)
# # end

# @candidates.each do |date|
#   begin
#   puts applydate(date)
#   rescue StandardError
#   puts "Candidates must have applied within the past 15 days."
#   end 
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
ask

