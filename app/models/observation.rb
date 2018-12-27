class Observation < ApplicationRecord
  has_many :attempts

  validates_presence_of :description, message: "deve ser preenchido"
end
