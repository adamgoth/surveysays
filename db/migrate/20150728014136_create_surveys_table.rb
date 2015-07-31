class CreateSurveysTable < ActiveRecord::Migration
  def change
    create_table :survey do |t|
      t.integer :user_id
      t.integer :question_id

      t.timestamps
    end
  end
end
