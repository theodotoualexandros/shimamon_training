require 'rails_helper'

RSpec.describe NotificationType, type: :model do
  it "is valid with valid attributes" do
    expect(NotificationType.new(name: 'test')).to be_valid
  end

  it "is not valid when no user given" do
    notification = NotificationType.new()
    expect(notification).to_not be_valid
  end
end
