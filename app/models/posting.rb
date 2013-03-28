class Posting < ActiveRecord::Base
	include PublicActivity::Common
  attr_accessible :image, :post, :post_on, :user_id, :video
  mount_uploader :image, AvatarUploader
  mount_uploader :video, AvatarUploader
  belongs_to :user
  has_many :comments
  # include PublicActivity::Model
  # tracked
end
