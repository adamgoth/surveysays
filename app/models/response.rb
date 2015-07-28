class Response < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	validates :user_id, :question_id, :response_text, presence: true
end