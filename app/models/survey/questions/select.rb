module Survey
  module Questions
    class Select < Survey::Question
      validates :answer_options, :presence => true

      def options
        answer_options.split(/\r?\n/)
      end

			def options_display_value
				answer_display_options.split(/\r?\n/)
			end
			
			def options_with_values
				options.zip(options_display_value)
			end
			
			def options_with_values_for_select
				options_display_value.zip(options)
			end

      def validate_answer(answer)
        super(answer)

        if rules[:presence] == "1" || answer.answer_text.present?
          answer.validates_inclusion_of :answer_text, :in => options
        end
      end
    end
  end
end
