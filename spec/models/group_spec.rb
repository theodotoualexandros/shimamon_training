require 'rails_helper'

RSpec.describe Group, type: :model do
  it "is valid with valid attributes" do
    expect(Group.new(name: "aa")).to be_valid
  end
end
