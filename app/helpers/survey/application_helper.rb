module Survey
  module ApplicationHelper
    def render_answer_form_helper(answer, form)
      partial = answer.question.type.to_s.split("::").last.downcase
      render partial: "survey/answers/#{partial}", locals: { f: form, answer: answer }
    end

    def checkbox_checked?(answer, option)
      answer.answer_text.to_s.split(",").include?(option)
    end
  end
end
