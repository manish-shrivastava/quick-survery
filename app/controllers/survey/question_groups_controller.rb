module Survey
  class QuestionGroupsController < Survey::ApplicationController
    before_filter :authenticate_administrator!, except: :index
    respond_to :html, :js
    respond_to :json, only: :results

    def index
      @question_groups = QuestionGroup.all
			@my_surveys = AnswerGroup.where(:user_id => current_user.id).order('created_at DESC')
			@show_all_surveys = AnswerGroup.order('created_at DESC')
      respond_with(@question_groups, @my_surveys)
    end

    def new
      @question_group = QuestionGroup.new
      respond_with(@question_group)
    end

    def create
      @question_group = QuestionGroup.new(question_group_params)
      @question_group.save

      respond_with(@question_group, location: question_groups_url)
    end

    def destroy
      @question_group = QuestionGroup.find(params[:id])
      @question_group.destroy

      respond_with(@question_group)
    end

    def results
      @question_group = QuestionGroup.find(params[:id])
      @question_group_results =
        QuestionGroupResults.new(question_group: @question_group).extract

      respond_with(@question_group_results, root: false)
    end

    private
    def question_group_params
      if Rails::VERSION::MAJOR == 4
        params.require(:question_group).permit(:name)
      else
        params[:question_group]
      end
    end
  end
end
