require "rails_helper"

RSpec.feature "Task management", type: :feature do
  let(:user) { FactoryBot.create(:user) }

  scenario "User creates a new task" do
    login_as(user, :scope => :user)
    visit "/tasks/new"

    fill_in I18n.t('tasks.name'), with: "My Name"
    expect(page).to have_text("Status")
    #select "finished", from: :status # doesn't work for some reason
    find(:xpath, '//option[contains(text(), "finished")]').select_option
    check("Label 1")
    #select '2019/01/01', from: 'Deadline'
    select_date "2019,6月,1", :from => "Deadline"
    click_button I18n.t 'helpers.submit.create'

    expect(page).to have_text("Task was successfully created.")
  end

  scenario "User visits task list" do
    user = FactoryBot.create(:user)
    task1 = FactoryBot.create(:task, name: "task1", deadline: "2018-05-14", status_id: 1, user_id: user.id)
    task2 = FactoryBot.create(:task, name: "task2", deadline: "2018-05-15", status_id: 2, user_id: user.id)
    task3 = FactoryBot.create(:task, name: "task3", deadline: "2018-05-16", status_id: 3, user_id: user.id)
    created_tasks = [task1, task2, task3]
    visit "/tasks"
    # TODO

  end

  scenario "User searches for task" do
  end

  scenario "User sorts tasks" do
  end

end
