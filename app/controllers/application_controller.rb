class ApplicationController < ActionController::Base
  include Userstamp

  before_filter :authenticate_user!
  
  protect_from_forgery with: :exception

  def after_invite_path_for(resource)
    users_path
  end

  def can_view
    if !current_user.has_role? :admin then
      redirect_to root_path
    end
  end
end
