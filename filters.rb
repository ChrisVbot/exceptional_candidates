class InvalidCandidateError < StandardError
end
# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require 'pry'
#Takes in a hash representing a candidate ID and returns that ID
def find(id)
  @candidates.each do | candidate |
    if candidate[:id] == id
      return candidate      
    end
  end
end

# end

#Takes in a hash representing a candidate and returns whether candidate 
#  has 2 years experience or more as boolean
def experienced?(candidate)
  unless candidate.has_key?(:years_of_experience)
    raise InvalidCandidateError
  end
  candidate[:years_of_experience] >= 2
end    


#Qualifies all candidates based on having greater than 100 github points
def github(candidate)
  unless candidate[:github_points] >= 100
    raise StandardError, 'candidate must have a github score of 100 or higher'
  end
end

#Checks hash to verify if candidate knows at least Ruby or Python
def languages(candidate)
  candidate[:languages].include?('Python') ||
  candidate[:languages].include?('Ruby')
end

#Checks application date of applicant
def applydate(candidate)
  unless candidate[:date_applied] >= 15.days.ago.to_date
    raise StandardError, 'candidate applied too long ago'
  end
end

#Checks if age of applicant is over 17
def applyage(candidate)
  candidate[:age] > 17
end

#Takes in collection of candidates, returns a subset of candidates that meet certain criteria
def qualified_candidates(candidates)
  qualified_candidates = []
  candidates.each do |candidate|
    if experienced?(candidate) && github(candidate) && languages(candidate) && applydate(candidate) && applyage(candidate)
      qualified_candidates << candidate
    end
  end
  return qualified_candidates
end

#Returns back all candidates but reordered such that candidates with most experience are on top
#  If candidates have same number of years experience, further sorted by their number of Github points
def ordered_by_qualifications(candidates)
  ordered_by_qualification = [] #creates an empty array for the candidates
  years_of_experience = candidates.sort { |a, b| [a[:years_of_experience], a[:github_points]] <=> [b[:years_of_experience], b[:github_points]] }
  ordered_by_qualification << years_of_experience.reverse
  return ordered_by_qualification
end


 








