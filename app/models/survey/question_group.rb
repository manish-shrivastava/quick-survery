module Survey
  class QuestionGroup < ActiveRecord::Base
    has_many  :questions
		has_many	:answer_groups
		has_many	:answers, :through => :answer_groups
    validates :name, :presence => true

    if Rails::VERSION::MAJOR == 3
      attr_accessible :name
    end
  end
end
