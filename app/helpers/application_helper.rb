module ApplicationHelper

    def set_status(status)
      current_user.status = status
    end

    
end
