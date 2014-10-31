module Survey
  class QuestionForm < Survey::BaseService
    AVAILABLE_QUESTIONS =
      [
			 Survey::Questions::Radio,
       Survey::Questions::Checkbox,
       Survey::Questions::Date,
       Survey::Questions::Long,
       Survey::Questions::Numeric,
       Survey::Questions::Select,
       Survey::Questions::Short,
      ]

    QUESTION_TYPES = AVAILABLE_QUESTIONS.inject({}) do |result, question|
      question_name = question.to_s.split("::").last
      result[question_name] = question.to_s
      result
    end

    attr_accessor :question_group, :question,
      :type, :question_text, :answer_options, :answer_display_options, :answer_presence, :question_label, :question_indent,
      :answer_minimum_length, :answer_maximum_length,
      :answer_greater_than_or_equal_to, :answer_less_than_or_equal_to, :question_category, :possible_score

    delegate :valid?, :errors, :id, :to => :question

    def to_model
      question
    end

    def initialize(params = {})
      from_question_to_attributes(params[:question]) if params[:question]
      super(params)
      @question ||= question_group.questions.new
    end

    def save
      @question.new_record? ? create_question : update_question
    end

    private
    def create_question
      klass = nil
      if QUESTION_TYPES.values.include?(type)
        klass = type.constantize
      else
        errors.add(:type, :invalid)
        return false
      end

      @question = klass.create(to_question_params)
    end

    def update_question
      @question.update_attributes(to_question_params)
    end

    def to_question_params
      {
        :question_group => question_group,
        :question_text  => question_text,
        :answer_options => answer_options,
				:answer_display_options => answer_display_options,
				:question_category => question_category,
				:possible_score => possible_score,
				:question_indent =>	question_indent,
				:question_label	=> question_label,
				
        :validation_rules => {
          :presence => answer_presence,
          :minimum  => answer_minimum_length,
          :maximum  => answer_maximum_length,
          :greater_than_or_equal_to => answer_greater_than_or_equal_to,
          :less_than_or_equal_to    => answer_less_than_or_equal_to
        }
      }
    end

    def from_question_to_attributes(question)
      self.type = question.type
      self.question_group  = question.question_group
      self.question_text   = question.question_text
      self.answer_options  = question.answer_options
			self.answer_display_options = question.answer_display_options
			self.question_category = question.question_category
			self.possible_score = question.possible_score
			self.question_indent = question.question_indent
			self.question_label = question.question_label
      self.answer_presence = question.rules[:presence]
      self.answer_minimum_length = question.rules[:minimum]
      self.answer_maximum_length = question.rules[:maximum]
      self.answer_greater_than_or_equal_to = question.rules[:greater_than_or_equal_to]
      self.answer_less_than_or_equal_to    = question.rules[:less_than_or_equal_to]
    end
  end
end
