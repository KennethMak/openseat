class Restaurant < ActiveRecord::Base
	has_many :reservations
	has_many :users, through: :reservations
	has_many :reviews

	def available?(party_size, start_time)
		party_size <= max_occupy
	end
end
