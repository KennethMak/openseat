class ReservationsController < ApplicationController
	before_filter :ensure_logged_in, only: [:create, :destroy]

	def index
		@reservations = Reservation.all
	end

	def new
		@reservation = Reservation.new
	end

	def show
		load_reservation
	end

	def edit
		load_reservation
	end

	def create
		@reservation = Reservation.new(reservation_params)
		@reservation.user = current_user

		if @reservation.save
			redirect_to reservation_path(@reservation), :notice => "You have made a reservation"
		else
			flash.now[:alert] = "Error! You need to log in first"
			render :new
		end
	end

	def update
		load_reservation

		if @reservation.update_attributes(reservation_params)
			redirect_to reservation_params(@reservation)
		else
			render :edit
		end
	end

	def destroy
		load_reservation
		@reservation = Reservation.destroy
		redirect_to reservations_path
	end


	private

	def reservation_params
		params.require(:reservation).permit(:restaurant_id, :party_size, :start)
	end

	def load_reservation
		@reservation = Reservation.find(params[:id])
	end

end