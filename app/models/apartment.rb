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
  #add paperclip
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :image, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }
end
