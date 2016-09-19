class Apartment < ActiveRecord::Base
  validates :address1, presence: true
  validates :address2, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :state, presence: true
  validates :country, presence: true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    @full_address = address1 + ", " + address2 + ", " + city + ", " + postal_code + ", " + state + ", " + country
  end
end
