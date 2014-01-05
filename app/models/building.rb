class Building < ActiveRecord::Base
	validates_presence_of :street_address
	validates_presence_of :city
	validates_presence_of :state
	validates_presence_of :postal_code
	validates :postal_code, :format => { :with => /\A(\+1)?[0-9]{5}\z/, :message => "Not a valid 5-digit postal code" }

	belongs_to :owner,
		inverse_of: :buildings
end
