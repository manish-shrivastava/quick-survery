FactoryGirl.define do
  factory :question do
    question_group  { FactoryGirl.create(:question_group) }
    question_text   "Sample Question"

    factory :q_checkbox, :class => "Survey::Questions::Checkbox" do
      answer_options  "hindi\r\ntelugu\r\nkannada\r\n"
    end

    factory :q_date, :class => "Survey::Questions::Date" do
    end

    factory :q_long, :class => "Survey::Questions::Long" do
    end

    factory :q_numeric, :class => "Survey::Questions::Numeric" do
    end

    factory :q_radio, :class => "Survey::Questions::Radio" do
      answer_options  "male\r\nfemale\r\n"
    end

    factory :q_select, :class => "Survey::Questions::Select" do
      answer_options  "mac\r\nwindows\r\n"
    end

    factory :q_short, :class => "Survey::Questions::Short" do
    end
  end
end
