class Admin::RestaurantsController < ApplicationController

  
  before_action :authenticate_user!
  before_action :authenticate_admin
  

  def index
    @restaurants = Restaurant.all
  end
  
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Restaurant Saved"
      redirect_to admin_restaurants_path
    else 
      flash.now[:alert] = "Restaurant fail to save"
      render :new
    end
  end
  
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to admin_restaurants_path
    else
      render :edit
    end
  end
  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.delete
    redirect_to admin_restaurants_path
  end
  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description)
  end

end
