class UsersController < ApplicationController
  def show
   
    @user = User.find(params[:id])
    @commented_restaurants = @user.restaurants.uniq

  end

  def edit
    
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path
    end
  
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      flash[:notice]= "Update Successfully!"
      redirect_to user_path
    else
      flsh.now[:alert] = "Error: fail to update"
      render :edit
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :intro, :avatar)
  end



end
