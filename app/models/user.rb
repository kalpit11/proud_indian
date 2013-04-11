class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid, :image
  has_many :postings
  has_many :poll_answers
  has_many :comments
  has_many :post_likes
   mount_uploader :image, AvatarUploader
   def self.create_with_omniauth(auth)
    #binding.pry
    temp = Tempfile.new([auth["uid"], ".jpg"])
    temp.binmode
    temp.write(open(auth["info"]["image"]).read)
    self.create(:provider=>auth["provider"],:uid=>auth["uid"],:name=>auth["info"]["name"],:image => temp)
  end
end
