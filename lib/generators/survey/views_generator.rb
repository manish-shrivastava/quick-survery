# inspired by devise and forem
require 'rails/generators'

module Survey
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../../../app/views/survey", __FILE__)
      desc "Copies default Survey views to your application."

      def copy_views
        view_directory :answer_groups
        view_directory :answers
        view_directory :question_groups
        view_directory :questions
      end

      protected
      def view_directory(name)
        directory name.to_s, "app/views/survey/#{name}"
      end
    end
  end
end
