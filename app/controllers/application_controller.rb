class ApplicationController < ActionController::Base
  #before_filter :get_notifications
  rescue_from CanCan::AccessDenied do |exception|
    render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
  end

  #def get_notifications
    #if user_signed_in?
      #@notifications = Notification.unread_by current_user
    #end
  #end
end
