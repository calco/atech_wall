class ApplicationController < ActionController::Base
	before_filter :set_locale
  include ControllerAuthentication
  protect_from_forgery

  def set_locale
	  if logged_in?
	  	I18n.locale = current_user.user_language
	  else
	  	I18n.default_locale
	  end
	end

	def default_url_options(options={})
	  logger.debug "default_url_options is passed options: #{options.inspect}\n"
	  {:locale => I18n.locale}
	end
end
