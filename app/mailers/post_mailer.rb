class PostMailer < ActionMailer::Base
  default :from => "ShameINdia.com"

  def new_post(post,user)
  	@user=user
  	@post=post
  	picture=@post.pictures.first
  	attachments["post.png"] = File.read("public/#{picture.image_url}")
    mail(:to => @user.email, :subject => "New Post")
  end

  def new_comment(user,post)
  	@user=user
  	@post=post

    mail(:to => @user.email, :subject => "New Post")
  end
end
