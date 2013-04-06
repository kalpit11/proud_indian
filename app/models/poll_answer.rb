class PollAnswer < ActiveRecord::Base
  attr_accessible :answer, :poll_id, :user_id
  belongs_to :poll
  belongs_to :user
end
