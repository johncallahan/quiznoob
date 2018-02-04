class Question < ActiveRecord::Base
  has_many :attempts
  has_many :quiz_questions
  has_many :quizzes, through: :quiz_questions
  has_many :question_answers
  has_many :answers, through: :question_answers
  belongs_to :answer
  before_destroy :no_referenced_attempts

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["quiz","question","url","points","answer","alt1","alt2","alt3","alt4","alt5"]
      all.each do |question|
        question.quizzes.each do |quiz|
          csv << [quiz.name, question.name, question.imageurl, question.points, question.answer.name].concat(question.answers.map{|x| x.name})
        end
      end
    end
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]

      quiz = Quiz.find_by(name: row["quiz"]) || Quiz.new
      quiz.name = row["quiz"]
      quiz.description = quiz.description.nil? ? "fill in a description" : quiz.description
      quiz.save!

      answer = Answer.find_by(name: row["answer"]) || Answer.new
      answer.name = row["answer"]
      answer.save!

      answers = []

      if(row["alt1"] != nil and (row["alt1"].is_a?(Numeric) or row["alt1"].length > 0))
        alt1 = Answer.find_by(name: row["alt1"]) || Answer.new
        alt1.name = row["alt1"]
        answers << alt1
	alt1.save!
      end

      if(row["alt2"] != nil and (row["alt2"].is_a?(Numeric) or row["alt2"].length > 0))
        alt2 = Answer.find_by(name: row["alt2"]) || Answer.new
        alt2.name = row["alt2"]
        answers << alt2
	alt2.save!
      end

      if(row["alt3"] != nil and (row["alt3"].is_a?(Numeric) or row["alt3"].length > 0))
        alt3 = Answer.find_by(name: row["alt3"]) || Answer.new
        alt3.name = row["alt3"]
        answers << alt3
	alt3.save!
      end

      if(row["alt4"] != nil and (row["alt4"].is_a?(Numeric) or row["alt4"].length > 0))
        alt4 = Answer.find_by(name: row["alt4"]) || Answer.new
        alt4.name = row["alt4"]
        answers << alt4
	alt4.save!
      end


      if(row["alt5"] != nil and (row["alt5"].is_a?(Numeric) or row["alt5"].length > 0))
        alt5 = Answer.find_by(name: row["alt5"]) || Answer.new
        alt5.name = row["alt5"]
        answers << alt5
	alt5.save!
      end


      if(row["alt6"] != nil and (row["alt6"].is_a?(Numeric) or row["alt6"].length > 0))
        alt6 = Answer.find_by(name: row["alt6"]) || Answer.new
        alt6.name = row["alt6"]
        answers << alt6
	alt.save!
      end

      questions = where(answer: Answer.where(name: row["answer"])).where(name: row["question"])
      question = questions.count > 0 ? questions.first : new
      question.name = row["question"]
      question.quizzes |= [quiz]
      question.imageurl = row["url"]
      question.points = row["points"].to_i
      question.answer = answer
      question.answers = answers
      question.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  private

  def no_referenced_attempts
    return if attempts.empty?

    errors.add :base, "This question is referenced by attempts(s): #{attempts.map(&:id).to_sentence}"
    false # If you return anything else, the callback will not stop the destroy from happening
  end

end
