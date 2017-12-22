class Attempt < ActiveRecord::Base
  validates :user, presence: true
  validates :quiz, presence: true
  validates :question, presence: true
  validates :answer, presence: true
  validates :result, exclusion: { in: [nil] }

  belongs_to :user
  belongs_to :quiz
  belongs_to :question
  belongs_to :answer

  def points
    question.points
  end
end
