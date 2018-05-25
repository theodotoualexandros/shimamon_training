require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    @task = Task.new
    @labels = Label.all
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do
    end
  end
end
