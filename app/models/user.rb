class User < ActiveRecord::Base
  attr_accessible :name, :provider, :uid
  has_many :postings
  has_many :poll_answers
  has_many :comments
  has_many :post_likes
   def self.create_with_omniauth(auth)
  	create! do |user|
	    user.provider = auth["provider"]
	    user.uid = auth["uid"]
    	user.name = auth["info"]["name"]
  	end
  end
end
