class PostLike < ActiveRecord::Base
  attr_accessible :posting_id, :user_id, :user_name
  belongs_to :posting
end
