require "rails_helper"

RSpec.feature "Task management", :type => :feature do
  scenario "User creates a new task" do
    visit "/tasks/new"

    fill_in "Name", :with => "My Name"
    click_button "Create Task"

    expect(page).to have_text("Task was successfully created.")
  end
end
