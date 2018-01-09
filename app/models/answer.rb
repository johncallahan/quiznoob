class Answer < ActiveRecord::Base
  has_many :questions
  has_many :attempts
  before_destroy :no_referenced_attempts
  before_destroy :no_referenced_questions

  private

  def no_referenced_questions
    return if questions.empty?

    errors.add :base, "This answer is referenced by question(s): #{questions.map(&:id).to_sentence}"
    false # If you return anything else, the callback will not stop the destroy from happening
  end

  def no_referenced_attempts
    return if attempts.empty?

    errors.add :base, "This answer is referenced by attempt(s): #{attempts.map(&:id).to_sentence}"
    false # If you return anything else, the callback will not stop the destroy from happening
  end
end
