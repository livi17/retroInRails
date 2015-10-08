class Location < ActiveRecord::Base
	belongs_to :user
	geocoded_by :address
	after_validation :geocode, :if => lambda{ :address_changed? }

	def create
		Address.create(location_params)
	end

	private

	def location_params
		params.require(:address).permit(:latitude, :longitude)
	end
end
