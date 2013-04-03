class Posting < ActiveRecord::Base
	include PublicActivity::Common
  attr_accessible :post, :post_on, :user_id, :video, :user_name, :caption, :pictures_attributes 
  mount_uploader :video, AvatarUploader
  belongs_to :user
  has_many :comments,:dependent=>:destroy
  has_many :pictures,:dependent=>:destroy
  has_many :post_likes,:dependent=>:destroy 
  accepts_nested_attributes_for :pictures, :allow_destroy => true
end
