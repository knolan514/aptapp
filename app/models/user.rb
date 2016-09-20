class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :email, uniqueness: true

  has_many :apartments

  has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :avatar, presence: true,
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }
end
