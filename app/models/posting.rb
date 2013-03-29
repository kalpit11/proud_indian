class Posting < ActiveRecord::Base
	include PublicActivity::Common
  attr_accessible :image, :post, :post_on, :user_id, :video, :user_name, :caption
  mount_uploader :image, AvatarUploader
  mount_uploader :video, AvatarUploader
  belongs_to :user
  has_many :comments,:dependent=>:destroy
  # include PublicActivity::Model
  # tracked
end
