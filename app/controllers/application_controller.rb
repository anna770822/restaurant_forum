class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  private
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "No User Right"
      redirect_to root_path
    end
  end

end
