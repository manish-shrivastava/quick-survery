# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "survey"
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["WS"]
  s.date = "2014-02-25"
  s.description = "Survey Tool"
  s.email = ["ws@ws.com"]
  s.files = ["app/assets", "app/assets/images", "app/assets/images/survey", "app/assets/javascripts", "app/assets/javascripts/survey", "app/assets/javascripts/survey/application.js", "app/assets/stylesheets", "app/assets/stylesheets/survey", "app/assets/stylesheets/survey/application.css", "app/controllers", "app/controllers/survey", "app/controllers/survey/answer_groups_controller.rb", "app/controllers/survey/application_controller.rb", "app/controllers/survey/question_groups_controller.rb", "app/controllers/survey/questions_controller.rb", "app/helpers", "app/helpers/survey", "app/helpers/survey/application_helper.rb", "app/models", "app/models/survey", "app/models/survey/answer.rb", "app/models/survey/answer_group.rb", "app/models/survey/question.rb", "app/models/survey/question_group.rb", "app/models/survey/questions", "app/models/survey/questions/checkbox.rb", "app/models/survey/questions/date.rb", "app/models/survey/questions/long.rb", "app/models/survey/questions/numeric.rb", "app/models/survey/questions/radio.rb", "app/models/survey/questions/select.rb", "app/models/survey/questions/short.rb", "app/serializers", "app/serializers/survey", "app/serializers/survey/question_result_serializer.rb", "app/services", "app/services/survey", "app/services/survey/answer_group_builder.rb", "app/services/survey/base_service.rb", "app/services/survey/question_form.rb", "app/services/survey/question_group_results.rb", "app/services/survey/question_result.rb", "app/views", "app/views/survey", "app/views/survey/answer_groups", "app/views/survey/answer_groups/new.html.erb", "app/views/survey/answers", "app/views/survey/answers/_checkbox.html.erb", "app/views/survey/answers/_date.html.erb", "app/views/survey/answers/_errors.html.erb", "app/views/survey/answers/_long.html.erb", "app/views/survey/answers/_numeric.html.erb", "app/views/survey/answers/_radio.html.erb", "app/views/survey/answers/_select.html.erb", "app/views/survey/answers/_short.html.erb", "app/views/survey/question_groups", "app/views/survey/question_groups/_form.html.erb", "app/views/survey/question_groups/_question_group.html.erb", "app/views/survey/question_groups/index.html.erb", "app/views/survey/question_groups/new.html.erb", "app/views/survey/question_groups/results.html.erb", "app/views/survey/questions", "app/views/survey/questions/_form.html.erb", "app/views/survey/questions/_question.html.erb", "app/views/survey/questions/edit.html.erb", "app/views/survey/questions/index.html.erb", "app/views/survey/questions/new.html.erb", "config/database.yml", "config/routes.rb", "db/migrate", "db/migrate/20130502170733_create_survey_question_groups.rb", "db/migrate/20130502195310_create_survey_questions.rb", "db/migrate/20130502195415_create_survey_answer_groups.rb", "db/migrate/20130502195504_create_survey_answers.rb", "lib/generators", "lib/generators/survey", "lib/generators/survey/views_generator.rb", "lib/survey", "lib/survey/engine.rb", "lib/survey/version.rb", "lib/survey.rb", "lib/tasks", "lib/tasks/survey_tasks.rake", "MIT-LICENSE", "Rakefile", "README.md"]
  s.homepage = "https://github.com/code-mancers/survey"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Surveys made easy."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.2.13"])
      s.add_runtime_dependency(%q<active_model_serializers>, ["~> 0.8.1"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<quiet_assets>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, ["= 2.0.3"])
      s.add_development_dependency(%q<capybara-webkit>, [">= 0"])
      s.add_development_dependency(%q<launchy>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.2.13"])
      s.add_dependency(%q<active_model_serializers>, ["~> 0.8.1"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<quiet_assets>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>, [">= 0"])
      s.add_dependency(%q<capybara>, ["= 2.0.3"])
      s.add_dependency(%q<capybara-webkit>, [">= 0"])
      s.add_dependency(%q<launchy>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.2.13"])
    s.add_dependency(%q<active_model_serializers>, ["~> 0.8.1"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<quiet_assets>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>, [">= 0"])
    s.add_dependency(%q<capybara>, ["= 2.0.3"])
    s.add_dependency(%q<capybara-webkit>, [">= 0"])
    s.add_dependency(%q<launchy>, [">= 0"])
  end
end
