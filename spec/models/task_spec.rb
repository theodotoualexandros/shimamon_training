require 'rails_helper'

RSpec.describe Task, :type => :model do
  it "is valid with valid attributes" do
    expect(Task.new(status_id: 1, name: 'name')).to be_valid
  end

  it "is not valid when name is > 12" do
    task = Task.new(name: '123456789012345')
    expect(task).to_not be_valid
  end

  it "is not valid when status id doesn't exist" do
    task = Task.new(status_id: 122)
    expect(task).to_not be_valid
  end

end
