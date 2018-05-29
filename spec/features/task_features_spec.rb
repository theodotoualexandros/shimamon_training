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
    login_as(user, :scope => :user)
    task1 = FactoryBot.create(:task, name: "task1", deadline: "2018-05-14", status_id: 1, user_id: user.id)
    task2 = FactoryBot.create(:task, name: "task2", deadline: "2018-05-15", status_id: 2, user_id: user.id)
    task3 = FactoryBot.create(:task, name: "task3", deadline: "2018-05-16", status_id: 3, user_id: user.id)
    created_tasks = [task1, task2, task3]
    visit "/tasks"
    expect(page).to have_link('New Task', href: new_task_path)

  end

  scenario "User searches for task" do
    task1 = FactoryBot.create(:task, name: "task1", deadline: "2018-05-14", status_id: 1, user_id: user.id)
    login_as(user, :scope => :user)

    visit "/tasks"
    fill_in 'q_name_cont', with: "task"
    select'finished', from: 'q_status_id_eq' 
    click_button '検索'
    expect(page).to_not have_text('task1')
    fill_in 'q_name_cont', with: "task"
    select 'not_started', from: 'q_status_id_eq' 
    click_button '検索'
    expect(page).to have_text('task1')

  end

  scenario "User sorts tasks" do
    task1 = FactoryBot.create(:task, name: "task1", deadline: "2018-05-14", status_id: 1, user_id: user.id)
    task2 = FactoryBot.create(:task, name: "task2", deadline: "2018-05-14", status_id: 1, user_id: user.id)
    login_as(user, scope: :user)
    visit "/tasks"
    click_on 'Name'
    expect('task1').to appear_before('task2')
    click_on 'Name'
    expect('task2').to appear_before('task1')
  end
end
