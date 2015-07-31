class AddRatingAndSurveyToResponsesTable < ActiveRecord::Migration
  def change
    add_column :responses, :rating, :integer
    add_column :responses, :survey_id, :integer
  end
end
