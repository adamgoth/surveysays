class Response < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	belongs_to :survey

	validates :user_id, :question_id, :response_text, :survey_id, :rating, presence: true
end