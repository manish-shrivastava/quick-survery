class CreateSurveyQuestionGroups < ActiveRecord::Migration
  def change
    create_table :survey_question_groups do |t|
      t.string  :name
      t.timestamps
    end
  end
end
