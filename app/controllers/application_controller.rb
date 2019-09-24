class ApplicationController < ActionController::Base
    before_action :check_logged_in

    def check_logged_in
        
        if !session.include?(:user_id)
            redirect_to new_session_path
        end
    end

end
