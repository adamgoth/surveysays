class Survey < ActiveRecord::Base
	has_many :survey_question_relationships
	has_many :questions, through: :survey_question_relationships

end