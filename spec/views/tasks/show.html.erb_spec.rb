require 'rails_helper'

RSpec.describe "tasks/show", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(status_id: 2, name: "ab", creator_id: FactoryBot.create(:user).id, deadline: Date.today))
  end

  it "renders attributes in <p>" do
    render
  end
end
