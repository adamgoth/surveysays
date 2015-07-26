class Question < ActiveRecord::Base
	belongs_to :user

	validates :user_id, :question_text, presence: true
end