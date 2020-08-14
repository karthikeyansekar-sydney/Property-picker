class ApplicationController < ActionController::Base
  before_action :fetch_user
  def fetch_user
    if session[:user_id].present?
      @current_user = User.find_by id: session[:user_id]
    end
    session[:user_id] = nil unless @current_user.present?
  end 
  def check_if_logged_in
    redirect_to login_path unless @current_user.present?
  end
end
