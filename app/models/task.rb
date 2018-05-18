class Task < ApplicationRecord
  belongs_to :status
  validates_length_of :name, :maximum => 12
  validates :status, presence: true
end
