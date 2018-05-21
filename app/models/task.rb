class Task < ApplicationRecord
  belongs_to :status
  belongs_to :user
  validates_length_of :name, :maximum => 12
  validates_presence_of :status
  validates :name, presence: true
end
