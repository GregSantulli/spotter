class User < ActiveRecord::Base

  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: true

  has_many :memberships
  has_many :gyms, through: :memberships

end
