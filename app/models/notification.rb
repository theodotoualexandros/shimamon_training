class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notification_type
  belongs_to :task
  acts_as_readable
end
