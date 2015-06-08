class User < ActiveRecord::Base

  # has_secure_password
  # validates :password, presence: true

  validates :email, presence: true, uniqueness: true

  has_many :gyms, through: :memberships
  has_many :memberships

  has_many :swipees, through: :swipes
  has_many :swipes, {
    :foreign_key => "user_id",
    :class_name => "Swipe"
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

  def unswiped_users(limit=50)
    User.all.reject{|user| self.swipees.include?(user) || user.id == self.id}.take(limit)
  end

end
