class Quiz < ActiveRecord::Base
  has_many :attempts
  has_many :users, through: :attempts
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
  belongs_to :subject

  def unattempted(user)
    return questions.joins("LEFT OUTER JOIN attempts ON attempts.question_id = questions.id AND attempts.user_id = " + user.id.to_s + " AND attempts.created_at > '" + Date.today.strftime("%Y-%m-%d") + " 00:00:00'").where(attempts: { id: nil }).map{|x| x.id}
  end
end
