class Quiz < ActiveRecord::Base
  has_many :attempts
  has_many :users, through: :attempts
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
  belongs_to :subject

  def unattempted(user)
    return questions.joins("LEFT OUTER JOIN attempts ON attempts.question_id = questions.id AND attempts.user_id = " + user.id.to_s + " AND attempts.created_at > '" + DateTime.now.in_time_zone("EST").beginning_of_day.in_time_zone(Time.zone).strftime("%Y-%m-%d %H:%M:%S") + "'").where(attempts: { id: nil }).map{|x| x.id}
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["quiz","description","bonus","subject","question","url","points","answer","alt1","alt2","alt3","alt4","alt5"]
      all.each do |quiz|
        quiz.questions.each do |question|
          csv << [quiz.name, quiz.description, quiz.points, quiz.subject.name, question.name, question.imageurl, question.points, question.answer.name].concat(question.answers.map{|x| x.name})
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
      puts(row["description"])
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
