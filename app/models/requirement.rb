class Requirement < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :badge
end
