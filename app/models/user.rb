class User < ApplicationRecord
  before_destroy :check_if_last_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :tasks, dependent: :destroy

  private
    def check_if_last_user
      if (User.count == 1)
        errors.add :base, "Cannot delete last user"
        throw(:abort)
      end
    end
end
