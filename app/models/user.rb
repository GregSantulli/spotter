class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true

  validates :password, presence: true

  has_many :memberships
  has_many :gyms, through: :memberships

end
