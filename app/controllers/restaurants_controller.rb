class RestaurantsController < ApplicationController
	before_filter :load_restaurant, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin, only: [:new, :create, :edit, :update, :destroy]

  # def index
  # 	@restaurants = Restaurant.all
  # end

  def index
    @restaurants = if params[:search]
      Restaurant.where("LOWER(name) LIKE LOWER(?)", "%#{params[:search]}%")
    else
      Restaurant.all
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    if current_user
      @review = @restaurant.reviews.build
    end
  end

  def new
  	@restaurant = Restaurant.new
  end

  def edit
  end

  def create
  	@restaurant = Restaurant.new(restaurant_params)
  	if @restaurant.save
  		redirect_to restaurants_url, :notice => "Restaurant added successfully"
  	else
      flash.now[:alert] = "Error"
      render :new
    end
  end

  def update
  	if @restaurant.update_attributes(restaurant_params)
  		redirect_to restaurants_url, :notice => "Update Successful!"
  	else
      flash.now[:alert] = "Update Failed!"
      render :edit
    end
  end

  def destroy
  	@restaurant.destroy
    redirect_to restaurants_url, :notice => "Delete successful!"
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
      redirect_to new_user_path, :notice => "ACCESS DENIED!"
    end
  end

end
