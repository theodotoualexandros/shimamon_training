require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let(:user) { FactoryBot.create(:user) }

  describe "GET /tasks" do
    it "works! (now write some real specs)" do
      login_as(user, :scope => :user)
      get tasks_path
      expect(response).to have_http_status(200)
    end
  end

  it "creates a Task and redirects to the Task's page" do
    login_as(user, :scope => :user)
    get "/tasks/new"
    expect(response).to render_template(:new)

    post "/tasks", :params => { task: { name: "task2",
                                        deadline: "2018-05-14", status_id: 1,
                                        user_id: 1} }

    expect(response).to redirect_to(assigns(:task))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Task was successfully created.")
  end

end
