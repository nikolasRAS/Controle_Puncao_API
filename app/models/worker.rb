class Worker < ApplicationRecord
  has_many :attempts

  validates_presence_of :description, messae: "deve ser preenchido"
end
