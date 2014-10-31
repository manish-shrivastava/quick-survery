module Survey
  class QuestionGroupResults < Survey::BaseService
    attr_accessor :question_group

    # extracts question along with results
    # each entry will have the following:
    # 1. question type and question id
    # 2. question text
    # 3. if aggregatable, return each option with value
    # 4. else return an array of all the answers given
    def extract
      @question_group.questions.collect do |question|
        results =
          case question
          when Survey::Questions::Select, Survey::Questions::Radio,
            Survey::Questions::Checkbox
            answers = question.answers.map(&:answer_text).map { |text|}.flatten
            answers.inject(Hash.new(0)) { |total, e| total[e] += 1; total }

          when Survey::Questions::Short, Survey::Questions::Date,
            Survey::Questions::Long, Survey::Questions::Numeric
            question.answers.pluck(:answer_text)
          end

        QuestionResult.new(question: question, results: results)
      end
    end

		def single
      @question_group.questions.collect do |question|
        results = question.answers.pluck(:answer_text)
        QuestionResult.new(question: question, results: results)
      end
    end


  end
end
