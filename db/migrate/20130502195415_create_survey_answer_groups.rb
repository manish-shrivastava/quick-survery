class CreateSurveyAnswerGroups < ActiveRecord::Migration
  def change
    create_table :survey_answer_groups do |t|
      t.references :question_group
      t.references :user, polymorphic: true

      t.timestamps
    end
    add_index :survey_answer_groups, :question_group_id
    add_index :survey_answer_groups, [:user_id, :user_type]
  end
end
