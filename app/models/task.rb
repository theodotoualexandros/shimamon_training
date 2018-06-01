class Task < ApplicationRecord
  belongs_to :status
  belongs_to :user
  has_and_belongs_to_many :labels
  validates_length_of :name, :maximum => 12
  validates_presence_of :status
  validates :name, presence: true
  validates_presence_of :deadline
end
