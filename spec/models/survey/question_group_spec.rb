require 'spec_helper'

describe Survey::QuestionGroup do
  describe "Validations" do
    it { should validate_presence_of(:name) }
  end

  describe "Associations" do
    it { should have_many(:questions) }
  end
end
