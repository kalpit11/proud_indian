class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :omniauthable,:database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:facebook,:google_oauth2,:twitter]
  has_many :articles
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name, :image
  # attr_accessible :title, :body
  has_many :postings
  has_many :poll_answers
  has_many :comments
  has_many :post_likes
  has_one :profile,:dependent=>:destroy
  mount_uploader :image, AvatarUploader
  def email_required?
  false
	end
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
	  user = User.where(:provider => auth.provider, :uid => auth.uid).first
	  unless user
	  	temp = Tempfile.new([auth["uid"], ".jpg"])
    	temp.binmode
    	temp.write(open(auth["info"]["image"]).read)
	    user = User.create(name:auth.extra.raw_info.name,
	                         provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20],
	                         image:temp	                         
	                         )
	    user.build_profile(name:user.name,email:user.email,image:temp)
	    user.profile.save
	  end
	  user
	end
	def self.find_for_twitter_oauth(auth, signed_in_resource=nil)

	  user = User.where(:provider => auth.provider, :uid => auth.uid).first
	  unless user
	    temp = Tempfile.new([auth["uid"], ".jpg"])
    	temp.binmode
    	temp.write(open(auth["info"]["image"]).read)
	    user = User.create(name:auth.extra.raw_info.name,
	                         provider:auth.provider,
	                         uid:auth.uid,
	                         email:auth.info.email,
	                         password:Devise.friendly_token[0,20],
	                         image:temp	                         
	                         )
			user.build_profile(name:user.name,image:temp)
	    user.profile.save	  
	  end
	  user
	end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
    	temp = Tempfile.new([access_token[:uid], ".jpg"])
    	temp.binmode
    	temp.write(open(data['image']).read)
        user = User.create(name: data["name"],
	    		   email: data["email"],
	    		   provider:access_token[:provider],
	    		   uid:access_token[:uid],
	    		   password:Devise.friendly_token[0,20],
	    		   image:temp
	    		  )
    	user.build_profile(name:user.name,email:user.email,image:temp)
	    user.profile.save
    end
    user
	end
end
