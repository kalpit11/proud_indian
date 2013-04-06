class PostLike < ActiveRecord::Base
	include PublicActivity::Common
  attr_accessible :posting_id, :user_id, :user_name
  belongs_to :posting
  belongs_to :user
end
