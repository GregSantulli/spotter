class User < ActiveRecord::Base

  # has_secure_password
  # validates :password, presence: true

  validates :email, presence: true, uniqueness: true

  has_many :memberships
  has_many :gyms, through: :memberships

  has_many :likers, through: :likers
  has_many :likes, {
    :foreign_key => "user_id",
    :class_name => "Like"
  }

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.first_name = auth['info']['first_name'] || ""
        user.last_name = auth['info']['last_name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end

end
