class Question < ActiveRecord::Base
	belongs_to :user
	has_many :responses
	has_many :survey_question_relationships
	has_many :surveys, through: :survey_question_relationships

	accepts_nested_attributes_for :responses

	validates :user_id, :question_text, presence: true
end