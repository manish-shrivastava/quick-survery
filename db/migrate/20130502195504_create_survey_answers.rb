class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.references :answer_group
      t.references :question
      t.text :answer_text

      t.timestamps
    end
    add_index :survey_answers, :answer_group_id
    add_index :survey_answers, :question_id
  end
end
