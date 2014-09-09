class RestaurantsController < ApplicationController
	before_filter :load_restaurant, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  def index
  	@restaurants = Restaurant.all
  end

  def show
  end

  def new
  	@restaurant = Restaurant.new
  end

  def edit
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)
  	if @restaurant.save
  		redirect_to restaurants_url
  	else
  		render :new
  	end
  end

  def update
  	if @restaurant.update_attributes(restaurant_params)
  		redirect_to restaurants_url
  	else
  		render :edit
  	end
  end

  def destroy
  	@restaurant.destroy
  		redirect_to restaurants_url
  end


  private

  def restaurant_params
  	params.require(:restaurant).permit(:name, :location, :description, :max_occupy)
  end

  def load_restaurant
  	@restaurant = Restaurant.find(params[:id])
  end

  def authorize_admin
    unless current_user && current_user.is_admin
      redirect_to restaurants_url
    end
  end

end
