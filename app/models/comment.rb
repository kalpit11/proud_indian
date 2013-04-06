class Comment < ActiveRecord::Base
	include PublicActivity::Common
  attr_accessible :commented_on, :content, :posting_id, :user_id, :user_name
  belongs_to :posting
  belongs_to :user
end
