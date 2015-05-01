class ApplicationController < ActionController::Base
  before_action :set_layout
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!
  include Pundit

  protect_from_forgery with: :exception

  after_action :verify_authorized,    except: :index, unless: :devise_or_pages_or_admin_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_or_pages_or_admin_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def set_layout
    if devise_controller?
      self.class.layout "home"
    elsif admin_controller?
      return
    else
      self.class.layout "application"
    end
  end

  def admin_controller?
    controller_path.start_with?('admin/')
  end

  def devise_or_pages_or_admin_controller?
    devise_controller? || pages_controller? || admin_controller?
  end

  def pages_controller?
    controller_name == "pages"  # Brought by the `high_voltage` gem
  end

  def user_not_authorized
    flash[:error] = I18n.t('controllers.application.user_not_authorized', default: "You can't access this page.")
    redirect_to(root_path)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
    devise_parameter_sanitizer.for(:sign_up) << :picture

    devise_parameter_sanitizer.for(:account_update) << :first_name
    devise_parameter_sanitizer.for(:account_update) << :last_name
    devise_parameter_sanitizer.for(:account_update) << :picture
  end
end
