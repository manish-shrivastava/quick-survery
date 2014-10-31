module Survey
  class QuestionResult < Survey::BaseService
    include ActiveModel::Serialization

    attr_accessor :question, :results

    def active_model_serializer
      Survey::QuestionResultSerializer
    end
  end
end
