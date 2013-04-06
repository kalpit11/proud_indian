class Poll < ActiveRecord::Base
  attr_accessible :answer, :dated, :question
  has_many :poll_answers
end
