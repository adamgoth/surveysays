class Question < ActiveRecord::Base
	belongs_to :user
	has_many :responses

	validates :user_id, :question_text, presence: true
end