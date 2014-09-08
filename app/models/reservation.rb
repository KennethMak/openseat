class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :restaurant
	validate :availability

	private

	def availability
		unless restaurant.available?(group_size, start)
			errors.add(:base, "Sorry, this restaurant is full!")
		end
	end
end
