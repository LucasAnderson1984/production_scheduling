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

  def handle_service_result(result, on_success, on_failure)
    if result.success?
      flash[:notice] = result.message
      on_success.call
    else
      flash[:alert] = result.message
      on_failure.call
    end
  end
end
