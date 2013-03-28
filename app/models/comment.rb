class Comment < ActiveRecord::Base
	include PublicActivity::Common
  attr_accessible :commented_on, :content, :posting_id, :user_id
  belongs_to :posting
end
