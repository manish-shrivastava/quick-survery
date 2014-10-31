module Survey
  class AnswerGroupsController < Survey::ApplicationController
    before_filter :find_question_group!
		before_filter :check_access, :only => [:destroy, :show]

    def new
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)
			@question_category = Question.select("DISTINCT question_category").where(:question_group_id => params[:question_group_id])
    end

    def create
      @answer_group_builder = AnswerGroupBuilder.new(answer_group_params)

      if @answer_group_builder.save
        redirect_to question_groups_path
      else
        render :new
      end
    end

		def show
			@answer_group = AnswerGroup.find(params[:id])
			@answers = Answer.where(:answer_group_id => params[:id])
		end
		
		def destroy
      @answer_group = AnswerGroup.find(params[:id])
      @answer_group.destroy
			if @answer_group.destroy
				flash[:notice] = "We have deleted the survey"
			end
			redirect_to "/surveys"

    end

    private
    def find_question_group!
      @question_group = QuestionGroup.find(params[:question_group_id])
    end

    def answer_group_params
      answer_params = { params: params[:answer_group] }
      answer_params.merge(user: current_user, question_group: @question_group)
    end
		def check_access
			@answer_group_id = AnswerGroup.find(params[:id])
			redirect_to '/surveys' and return flash[:alert] = "Opps! Something went wrong." unless can_administer? || current_user.id == @answer_group_id.user_id
		end

  end
end
