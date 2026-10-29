class ApplicationController < ActionController::Base
  include Authentication

  allow_browser versions: :modern

  helper_method :current_user, :admin?, :receptionist?, :staff?

  private

  def current_user
    Current.user
  end

  def admin?
    current_user&.admin? || false
  end

  def receptionist?
    current_user&.receptionist? || false
  end

  def staff?
    current_user&.staff? || false
  end

  def authorize_admin!
    head :forbidden unless admin?
  end

  def authorize_admin_or_receptionist!
    head :forbidden unless admin? || receptionist?
  end
end
