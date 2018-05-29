require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it "always has at least one" do
    Task.delete_all
    User.delete_all
    user = FactoryBot.create(:user)
    expect { user.destroy }.to_not change(User, :count)
  end
end
