class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def is_employee?
        if current_user.present? then
            Employee.where(user_id: current_user.id).exists?
        else
            false
        end
    end

    helper_method :is_employee?
end
