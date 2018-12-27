class Attempt < ApplicationRecord
  belongs_to :record
  belongs_to :worker
  belongs_to :observation

  validates :d_puncture, :try, :record_id, :worker_id, :observation_id, presence: true  
  validates :record_id,:try, numericality: {only_integer: true, greater_than: 0}

end
