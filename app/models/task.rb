class Task < ApplicationRecord
  belongs_to :status
  has_and_belongs_to_many :groups
  belongs_to :creator, class_name: "User"
  has_and_belongs_to_many :labels
  validates_length_of :name, maximum: 12
  validates_presence_of :status
  validates :name, presence: true
  validates_presence_of :deadline
  validates_presence_of :creator
  mount_uploader :image, ImageUploader
end
