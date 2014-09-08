class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations

	def available?(party_size, start_time)
		party_size <= capacity
	end
end
