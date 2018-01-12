Class Admin::Basecontroller < ApplicaionController

  
  before_action :authenticate_admin

  private
  def authenticate_admin
    unless current_user.admin?
      flash[:alert] = "No User Right"
      redirect_to root_path
    end
  end

end