class Quiz < ActiveRecord::Base
  has_many :attempts
  has_many :users, through: :attempts
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
  belongs_to :subject
  before_destroy :no_referenced_attempts

  def unattempted(user)
    return questions.joins("LEFT OUTER JOIN attempts ON attempts.question_id = questions.id AND attempts.user_id = " + user.id.to_s + " AND attempts.created_at > '" + DateTime.now.in_time_zone("EST").beginning_of_day.in_time_zone(Time.zone).strftime("%Y-%m-%d %H:%M:%S") + "'").where(attempts: { id: nil }).sample(10).map{|x| x.id}
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << ["quiz","description","bonus","subject"]
      all.each do |quiz|
        csv << [quiz.name, quiz.description, quiz.points, quiz.subject.name]
      end
    end
  end

  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      subject = Subject.find_by(name: row["subject"]) || Subject.new
      subject.name = row["subject"]
      quiz = find_by(name: row["quiz"]) || new
      quiz.name = row["quiz"]
      quiz.description = row["description"]
      quiz.points = row["bonus"].to_i
      quiz.subject = subject
      subject.save!
      quiz.save!
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

    errors.add :base, "This quiz is referenced by attempts(s): #{attempts.map(&:id).to_sentence}"
    false # If you return anything else, the callback will not stop the destroy from happening
  end

end
