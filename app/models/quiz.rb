class Quiz < ActiveRecord::Base
  has_many :attempts
  has_many :users, through: :attempts
end