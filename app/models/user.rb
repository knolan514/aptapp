class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, email: true
  validates :email, uniqueness: true

  has_many :apartments
end
