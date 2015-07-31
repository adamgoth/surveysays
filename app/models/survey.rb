class Survey < ActiveRecord::Base
	has_many :survey_question_relationships
	has_many :questions, through: :survey_question_relationships
	has_many :responses, through: :questions

	accepts_nested_attributes_for :questions

	def responses_count
		Response.where(survey_id: id).all.count
	end

	def responses
		Response.where(survey_id: id).order(:question_id).all
	end
end