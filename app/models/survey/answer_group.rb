module Survey
  class AnswerGroup < ActiveRecord::Base
		attr_accessible :question_group, :user, :answers_attributes
    belongs_to :question_group
    belongs_to :user, polymorphic: true
    has_many	:answers, inverse_of: :answer_group, autosave: true
		has_many	:questions, :through => :answers
		accepts_nested_attributes_for :answers
		after_create	:sum_and_create, :possible_score_and_create, :location_and_create, :sum_create_all


		private
		
		def answer_group_joins_questions
			Answer.joins(:question)
		end
		
		def sum_and_create
			last_survey = self.id
			sum = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_answers.answer_group_id = ?", "0", last_survey).sum(:answer_text)
			self.update_column(:sum, sum)
		end
		
		def possible_score_and_create
			last_survey = self.id
			possible_score = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_answers.answer_group_id = ?", "0", last_survey).sum(:possible_score)
			self.update_column(:possible_score, possible_score)
		end
		
		def location_and_create
			last_survey = self.id
			location = Answer.where("survey_answers.question_id IN (?) AND survey_answers.answer_group_id = ?", [3, 26, 47], last_survey).pluck(:answer_text)
			self.update_column(:location, location)
		end
		
		
		
		def sum_and_create_basic_compliance
			last_survey = self.id
			disqualify = Answer.where("survey_answers.question_id = ? AND survey_answers.answer_group_id = ?", "4", last_survey).pluck(:answer_text)
			if disqualify == ["0"]
				sum = "0"
			else
				sum = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "2", last_survey).sum(:answer_text)
			end
			self.update_column(:basic_compliance_sum, sum)
		end
		
		def possible_score_basic_compliance
			last_survey = self.id
			possible_score = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "2", last_survey).sum(:possible_score)
			self.update_column(:basic_compliance_possible, possible_score)
		end
		
		
		
		def sum_and_create_transparency
			last_survey = self.id
			sum = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "3", last_survey).sum(:answer_text)
			self.update_column(:transparency_sum, sum)
		end
		
		def possible_score_transparency
			last_survey = self.id
			possible_score = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "3", last_survey).sum(:possible_score)
			self.update_column(:transparency_possible, possible_score)
		end
		
		
		
		def sum_and_create_facilities
			last_survey = self.id
			sum = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "4", last_survey).sum(:answer_text)
			self.update_column(:facilities_sum, sum)
		end
		
		def possible_score_facilities
			last_survey = self.id
			possible_score = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "4", last_survey).sum(:possible_score)
			self.update_column(:facilities_possible, possible_score)
		end
		
		
		
		def sum_and_create_process_flow
			last_survey = self.id
			disqualify = Answer.where("survey_answers.question_id = ? AND survey_answers.answer_group_id = ?", "41", last_survey).pluck(:answer_text)
			if disqualify == ["0"]
				sum = "0"
			else
				sum = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "5", last_survey).sum(:answer_text)
			end
			self.update_column(:process_flow_sum, sum)
		end
		
		def possible_score_process_flow
			last_survey = self.id
			possible_score = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "5", last_survey).sum(:possible_score)
			self.update_column(:process_flow_possible, possible_score)
		end
		
		
		
		def sum_and_create_officers
			last_survey = self.id
			sum = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "6", last_survey).sum(:answer_text)
			self.update_column(:officers_sum, sum)
		end
		
		def possible_score_officers
			last_survey = self.id
			possible_score = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "6", last_survey).sum(:possible_score)
			self.update_column(:officers_possible, possible_score)
		end
		
		
		
		
		def sum_and_create_feedback
			last_survey = self.id
			sum = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "7", last_survey).sum(:answer_text)
			self.update_column(:feedback_sum, sum)
		end
		
		def possible_score_feedback
			last_survey = self.id
			possible_score = answer_group_joins_questions.where("survey_questions.possible_score > ? AND survey_questions.question_category = ? AND survey_answers.answer_group_id = ?", "0", "7", last_survey).sum(:possible_score)
			self.update_column(:feedback_possible, possible_score)
		end
		
		

		def sum_create_all
			if self.question_group_id == 1
				sum_and_create_basic_compliance && possible_score_basic_compliance && sum_and_create_facilities && possible_score_facilities
				
			elsif self.question_group_id == 2
				sum_and_create_transparency && possible_score_transparency && sum_and_create_process_flow && possible_score_process_flow && sum_and_create_officers && possible_score_officers
				
			elsif self.question_group_id == 3
				sum_and_create_feedback && possible_score_feedback
			end

		end



  end
end
