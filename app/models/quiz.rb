class Quiz < ActiveRecord::Base
  has_many :attempts
  has_many :users, through: :attempts
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
end
