class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]

    if session[:user_id]
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_user
    curr_user = current_user
    if curr_user==nil
      redirect_to '/login'
    elsif curr_user.admin?
      redirect_to '/complaints'
    end
  end

end