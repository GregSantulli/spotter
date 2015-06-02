class User < ActiveRecord::Base

  # has_secure_password
  # validates :password, presence: true

  validates :email, presence: true, uniqueness: true

  has_many :memberships
  has_many :gyms, through: :memberships

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end

end
