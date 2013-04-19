class PostUnlike < ActiveRecord::Base
	include PublicActivity::Common
  attr_accessible :posting_id, :user_id, :user_name
  belongs_to :user
  belongs_to :posting
end
