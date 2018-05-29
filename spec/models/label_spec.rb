require 'rails_helper'

RSpec.describe Label, type: :model do
  it "is valid with valid attributes" do
    expect(Label.new(name: "aa")).to be_valid
  end
end
