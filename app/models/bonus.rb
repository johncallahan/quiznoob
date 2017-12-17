class Bonus < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
  belongs_to :award
end
