class PollsController < ApplicationController
	def create_poll_answer
		@poll=Poll.find(params[:poll_id])
		@poll_answer = @poll.poll_answers.new(params[:poll_answer])
		if @poll_answer.save
      redirect_to postings_path
    end
	end

	def create
		@poll=Poll.new(params[:poll])
		if @poll.save
			redirect_to postings_path
		end
	end
end
