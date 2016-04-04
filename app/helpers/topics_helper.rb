module TopicsHelper
    def is_admin_or_moderator?
        current_user && (current_user.admin? || current_user.moderator?)
    end
    
    def is_admin?
        current_user && (current_user.admin?)
    end
end
