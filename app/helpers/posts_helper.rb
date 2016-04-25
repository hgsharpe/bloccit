module PostsHelper
  def user_is_authorized_for_post?(post, edit)
    current_user && (current_user == post.user || current_user.admin?)
  end
end
