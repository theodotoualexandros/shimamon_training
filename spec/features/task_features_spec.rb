require "rails_helper"

RSpec.feature "Task management", type: :feature do
  let(:user) { FactoryBot.create(:user, group_ids: Group.all.ids) }

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
    attach_file 'Image', Rails.root.join('spec', 'support', 'brands', 'logos', '123.jpg')
    #upload_directly(ImageUploader.new, "Image")
    click_button I18n.t 'helpers.submit.create'

    expect(page).to have_text("Task was successfully created.")
  end

  scenario "User visits task list" do
    login_as(user, :scope => :user)
    FactoryBot.create(:task, name: "task1", deadline: "2018-05-14", status_id: 1, creator_id: user.id)
    FactoryBot.create(:task, name: "task2", deadline: "2018-05-15", status_id: 2, creator_id: user.id)
    FactoryBot.create(:task, name: "task3", deadline: "2018-05-16", status_id: 3, creator_id: user.id)
    visit "/tasks"
    expect(page).to have_link('New Task', href: new_task_path)

  end

  scenario "User searches for task" do
    login_as(user, :scope => :user)
    FactoryBot.create(:task, name: "task12", deadline: "2018-05-14", status_id: 1, creator_id: user.id,
                              group_ids: Group.all.ids)
    visit "/tasks"
    fill_in 'q_name_cont', with: "task"
    select 'finished', from: 'q_status_id_eq'
    click_button '検索'
    expect(page).to_not have_text('task12')
    fill_in 'q_name_cont', with: "task12"
    select 'not_started', from: 'q_status_id_eq'
    click_button '検索'
    expect(page).to have_text('task12')

  end

  scenario "User sorts tasks" do
    FactoryBot.create(:task, name: "Atask", deadline: "2018-05-14", status_id: 1, creator_id: user.id, group_ids: Group.all.ids)
    FactoryBot.create(:task, name: "Btask", deadline: "2018-05-14", status_id: 1, creator_id: user.id, group_ids: Group.all.ids)
    FactoryBot.create(:task, name: "Ztask", deadline: "2018-05-14", status_id: 1, creator_id: user.id, group_ids: Group.all.ids)
    FactoryBot.create(:task, name: "Ytask", deadline: "2018-05-14", status_id: 1, creator_id: user.id, group_ids: Group.all.ids)
    login_as(user, scope: :user)
    visit "/tasks"
    click_on 'Name'
    expect('Atask').to appear_before('Btask')
    click_on 'Name'
    expect('Ztask').to appear_before('Ytask')
  end
end
