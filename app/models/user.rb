class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # validates :name, presence: true
  # validates :email, presence: true, email: true
  # validates :email, uniqueness: true

  has_many :apartments

  has_attached_file :avatar, styles: { small: "64x64", med: "100x100", large: "200x200" }
  validates_attachment :avatar, 
    content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
    size: { in: 0..10.megabytes }
end
