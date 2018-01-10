class Admin::RestaurantsController < ApplicationController

  
  before_action :authenticate_user!
  before_action :authenticate_admin
  before_action :set_restaurant, :only => [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.page(params[:page]).per(10)
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
  
 

  def update

    if @restaurant.update_attributes(restaurant_params)
      flash[:notice] = " Update successfully!"
      redirect_to admin_restaurants_path
    else
      flash.now[:alert] = "Error: Fail to update"
      render :edit
    end
  end
  def destroy

    @restaurant.delete
    flash[:notice] = "picture deleted"
    redirect_to admin_restaurants_path

  end


  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :tel, :address, :opening_hours, :description, :image)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
