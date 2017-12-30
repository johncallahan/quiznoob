class Question < ActiveRecord::Base
  has_many :attempts
  has_many :quiz_questions
  has_many :quizzes, through: :quiz_questions
  has_many :question_answers
  has_many :answers, through: :question_answers
  belongs_to :answer

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
      puts(row["quiz"])
      puts(row["question"])
      puts(row["url"])
      puts(row["points"])
      puts(row["answer"])
      puts(row["alt1"])
      puts(row["alt2"])
      puts(row["alt3"])
      puts(row["alt4"])
      puts(row["alt5"])
      puts(row["alt6"])
# Question.where(answer: Answer.where(name: row["answer"])).where(name: row["question"])
#      quiz = find_by(id: row["id"]) || new
#      quiz.attributes = row.to_hash
#      quiz.save!
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

end
