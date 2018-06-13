class CalendarController < ApplicationController
  def show
    @tasks = Task.all
  end
end
