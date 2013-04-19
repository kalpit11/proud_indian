class Posting < ActiveRecord::Base
	include PublicActivity::Common
  attr_accessible :post, :post_on, :user_id, :video, :user_name, :caption, :pictures_attributes, :address, :longitude,:latitude
  mount_uploader :video, AvatarUploader
  belongs_to :user
  has_many :comments,:dependent=>:destroy
  has_many :pictures,:dependent=>:destroy
  has_many :post_likes,:dependent=>:destroy 
  has_many :post_unlikes,:dependent=>:destroy 
  has_many :comment_likes,:dependent=>:destroy 
  has_many :comment_unlikes,:dependent=>:destroy 
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
