class Picture < ActiveRecord::Base
  attr_accessible :image, :posting_id
  mount_uploader :image, AvatarUploader
  belongs_to :postings
end
