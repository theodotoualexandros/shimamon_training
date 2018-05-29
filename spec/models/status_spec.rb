require 'rails_helper'

RSpec.describe Status, type: :model do
  it "is valid with valid attributes" do
    expect(Status.new(name: "aa")).to be_valid
  end
end
