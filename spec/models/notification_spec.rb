require 'rails_helper'

RSpec.describe Notification, type: :model do
  it "is valid with valid attributes" do
    expect(Notification.new(user_id: FactoryBot.create(:user).id,
                            task_id: 1, notification_type_id: 1)).to be_valid
  end

  it "is not valid when no user given" do
    notification = Notification.new()
    expect(notification).to_not be_valid
  end
end
