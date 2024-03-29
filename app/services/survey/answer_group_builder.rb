module Survey
  class AnswerGroupBuilder < Survey::BaseService
    attr_accessor :user, :question_group, :questions, :answers, :answer_group, :params

    def initialize(params = {})
      super(params)
      build_answer_group
    end

    def to_model
      @answer_group
    end

    def save!(options = {})
      params.each do |question_id, answer_attributes|
        if answer = @answer_group.answers.find { |a| a.question_id.to_s == question_id.to_s }
          text = answer_attributes[:answer_text]
          answer.answer_text =
            text.is_a?(Array) ? strip_checkbox_answers(text).join(',') : text
        end
      end

      @answer_group.save!(options)
    end

    def save(options = {})
      save!(options)
    rescue Exception => e
      # repopulate answers here in case of failure as they are not getting updated
      @answers = @question_group.questions.collect do |question|
        @answer_group.answers.find { |a| a.question_id == question.id }
      end
      false
    end

    private
    def build_answer_group
      @answer_group = AnswerGroup.new(user: user, question_group: question_group)
      @answers = @question_group.questions.collect do |question|
        @answer_group.answers.build(question_id: question.id)
      end
    end

    def strip_checkbox_answers(text)
      text.reject(&:blank?).reject { |t| t == "0" }
    end
  end
end
