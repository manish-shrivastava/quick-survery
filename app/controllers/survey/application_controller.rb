module Survey
  class ApplicationController < ::ApplicationController
    helper_method :can_administer?, :can_administer?

    def authenticate_administrator!
      unless can_administer?
        raise Survey::AccessDenied.new("cannot administer questions")
      end
    end
		
		def authenticate_survey_takers!
	    unless can_take_survey? || can_administer?
	      redirect_to "/"
	    end
	  end

		def can_administer?
			user_signed_in? && current_user.superadmin?
		end

		def can_take_survey?
			user_signed_in? && current_user.member_level == 2
		end

  end
end
