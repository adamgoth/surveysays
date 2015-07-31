class SurveyQuestionRelationships < ActiveRecord::Migration
  def change
    create_table :survey_question_relationships do |t|
      t.integer :survey_id
      t.integer :question_id

      t.timestamps
    end
  end
end
