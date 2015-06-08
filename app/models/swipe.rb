class Swipe < ActiveRecord::Base

  validates :user_id, :user_id, presence: true

  belongs_to :user, {
    :foreign_key => "user_id",
    :class_name => "User"
  }

  belongs_to :swipee, {
    :foreign_key => "swipee_id",
    :class_name => "User"
  }

end
