class NotificationsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!

  def index
    @notifications = Notification.includes(:task).unread_by(current_user)
    render @notifications
  end
end
