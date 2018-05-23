require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(status_id: 1, name: "aa", user_id: FactoryBot.create(:user).id,
                                       label_ids: [FactoryBot.create(:label).id]))
    @labels = @task.labels
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do
    end
  end
end
