class NotificationType < ApplicationRecord
  validates_presence_of :name
  has_many :notifications
end
