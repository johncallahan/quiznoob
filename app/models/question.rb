class Question < ActiveRecord::Base
  has_many :attempts
  has_many :quiz_questions
  has_many :quizzes, through: :quiz_questions
  has_many :question_answers
  has_many :answers, through: :question_answers
  belongs_to :answer
end
