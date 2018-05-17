require "rails_helper"

RSpec.feature "Task management", :type => :feature do
  scenario "User creates a new task" do
    visit "/tasks/new"

    fill_in I18n.t('tasks.name'), :with => "My Name"
    click_button I18n.t 'helpers.submit.create'

    expect(page).to have_text("Task was successfully created.")
  end

  scenario "User visits task list" do
    task1 = FactoryBot.create(:task, name: "task1", deadline: "2018-05-14")
    task2 = FactoryBot.create(:task, name: "task2", deadline: "2018-05-15")
    task3 = FactoryBot.create(:task, name: "task3", deadline: "2018-05-16")
    created_tasks = [task1, task2, task3]
    visit "/tasks"

    created_tasks.each_with_index do |element,index|
      if index > 0
        page.body.index(element.name).should > page.body.index(created_tasks[index - 1].name)
      end
    end

    visit "/tasks?direction=desc&sort=deadline"

    created_tasks.each_with_index do |element,index|
      if index > 0
        page.body.index(element.name).should < page.body.index(created_tasks[index - 1].name)
      end
    end
  end

end
