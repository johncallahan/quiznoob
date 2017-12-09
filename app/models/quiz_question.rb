class QuizQuestion < ActiveRecord::Base
  belongs_to :quiz
  belongs_to :question
  has_many :attempts, lambda {|params| where(:user_id => :params[0], :quiz_id => :params[1], :question_id => :params[2] ) }
end
