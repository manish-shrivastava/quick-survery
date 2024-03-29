require "spec_helper"

describe Survey::QuestionResultSerializer do
  include Survey::QuestionSpecHelper
  include Survey::AnswerSpecHelper

  let(:question_group) { FactoryGirl.create(:question_group) }
  let(:results) do
    Survey::QuestionGroupResults.new(question_group: question_group).extract
  end

  before do
    create_questions(question_group)
    create_answers
  end

  describe "#to_json" do
    let(:aggregatable_result) do
      results.select { |r| r.question.is_a?(Survey::Questions::Radio) }.first
    end

    let(:json_data) do
      ActiveSupport::JSON.decode(described_class.new(aggregatable_result).to_json)
    end

    it "converts to with a hash of results" do
      expect(json_data["question_type"]).to eq "Survey::Questions::Radio"
      expect(json_data["question_text"]).to eq aggregatable_result.question.question_text
      expect(json_data["results"]).not_to be_empty
      expect(json_data["results"]).to be_a Hash
    end

    context "when question cannot be aggregated" do
      let(:aggregatable_result) do
        results.select { |r| r.question.is_a?(Survey::Questions::Short) }.first
      end

      it "returns an array of results" do
        expect(json_data["results"]).not_to be_empty
        expect(json_data["results"]).to be_a Array
      end
    end
  end
end
