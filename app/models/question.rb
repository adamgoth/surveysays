class Question < ActiveRecord::Base
	belongs_to :user
	has_many :responses
	has_many :survey_question_relationships
	has_many :surveys, through: :survey_question_relationships

	validates :user_id, :question_text, presence: true
end