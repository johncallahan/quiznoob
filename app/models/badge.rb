class Badge < ActiveRecord::Base
  has_many :requirements
  belongs_to :subject
  has_ancestry
end
