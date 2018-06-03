class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include SessionsHelper
  before_filter :track_request_params

  def track_request_params
    RequestStore.store[:remote_ip] = request.remote_ip
    RequestStore.store[:user_agent] = request.user_agent
    RequestStore.store[:user_id] = if current_user.present?
      current_user.try(:id)
    else
      nil
    end
  end
end
