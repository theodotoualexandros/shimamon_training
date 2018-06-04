require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:q) { Task.ransack(params[:q]) }
  let(:tasks) { q.result.includes(:users).where(users: { id: user.id }) }
  before(:each) do
    assign(:tasks, [
      FactoryBot.create(:task, name: "task1", deadline: "2018-05-14", status_id: 1, creator_id: user.id)
    ])
    assign(:q, q)
  end

  it "renders a list of tasks" do
    assign(:tasks, tasks.page(params[:page]).per(10))
    login_as(user, :scope => :user)
    render
  end
end
