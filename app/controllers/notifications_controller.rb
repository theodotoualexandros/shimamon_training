class NotificationsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!, :set_notification

  def index
    render @notifications
  end

  def read
    @notification.mark_as_read! for: current_user
    redirect_to request.referer
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

end
