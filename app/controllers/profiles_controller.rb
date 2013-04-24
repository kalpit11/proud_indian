class ProfilesController < ApplicationController
	def edit
		@activities = PublicActivity::Activity.order("created_at desc").page(params[:page]).per(5)
		@profile = Profile.find(params[:id])
	end

	def update
		@profile = Profile.find(params[:id])

    @profile.update_attributes(params[:profile])
      redirect_to postings_path
	end
end
