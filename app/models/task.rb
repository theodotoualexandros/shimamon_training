class Task < ApplicationRecord
  validates_length_of :name, :maximum => 12
end
