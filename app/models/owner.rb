class Owner < ActiveRecord::Base
	validates_presence_of :first_name
	validates_presence_of :last_name
	validates_presence_of :email
	validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

	has_many :buildings,
	inverse_of: :owner,
	dependent: :destroy

end
