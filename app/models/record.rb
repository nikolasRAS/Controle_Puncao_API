class Record < ApplicationRecord
  belongs_to :age_range
  has_many :attempts
  
  validates_presence_of :patient, message: "deve ser preenchido"
  validates_presence_of :protocol, message: "deve ser preenchido"
  validates_presence_of :age, message: "deve ser preenchido"
  validates_presence_of :age_range_id, message: "deve ser preenchido"

  validates_numericality_of :age, greater_than: 0, message: "deve ser preenchido apenas com um número maior do que 0"
  
  validates_uniqueness_of :protocol, message: "deve ser único no sistema"
end
