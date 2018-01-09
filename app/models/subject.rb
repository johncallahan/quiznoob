class Subject < ActiveRecord::Base
  has_many :quizzes
  before_destroy :no_referenced_quizzes

  private

  def no_referenced_quizzes
    return if quizzes.empty?

    errors.add :base, "This subject is referenced by quiz(zes): #{quizzes.map(&:id).to_sentence}"
    false # If you return anything else, the callback will not stop the destroy from happening
  end

end
