class Place < ApplicationRecord
	belongs_to :user
	geocoded_by :address
	after_validation :geocode 

	validates :name, presence: true, length: { minimum: 3 }
end

place = Place.new(name: "New Place")
place.valid? # => true
place.errors[:name] # => []
 
place = Place.new(name: "NP")
place.valid? # => false
place.errors[:name] # => ["is too short (minimum is 3 characters)"]
 
place = Place.new
place.valid? # => false
place.errors[:name]
 # => ["can't be blank", "is too short (minimum is 3 characters)"]
