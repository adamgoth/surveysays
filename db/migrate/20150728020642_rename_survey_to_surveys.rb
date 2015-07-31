class RenameSurveyToSurveys < ActiveRecord::Migration
  def change
  	rename_table :survey, :surveys
  end
end
