class Profile < ActiveRecord::Base
  attr_accessible :address, :email, :name, :image
  mount_uploader :image, AvatarUploader
  belongs_to :user
end
