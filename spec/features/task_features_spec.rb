require "rails_helper"

RSpec.feature "Task management", :type => :feature do
  scenario "User creates a new task" do
    visit "/tasks/new"

    fill_in I18n.t('tasks.name'), :with => "My Name"
    click_button I18n.t 'helpers.submit.create'

    expect(page).to have_text("Task was successfully created.")
  end
end
