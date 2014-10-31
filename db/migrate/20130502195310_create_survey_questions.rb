class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.references :question_group
      t.string  :type
      t.string  :question_text
      t.integer :position
      t.text :answer_options
      t.text :validation_rules

      t.timestamps
    end
    add_index :survey_questions, :question_group_id
  end
end
