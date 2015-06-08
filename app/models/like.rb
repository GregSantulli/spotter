class Like < ActiveRecord::Base

  belongs_to :user, {
    :foreign_key => "user_id",
    :class_name => "User"
  }

    belongs_to :liker, {
    :foreign_key => "liker_id",
    :class_name => "User"
  }



end
