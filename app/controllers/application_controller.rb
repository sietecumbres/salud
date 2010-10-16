class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :set_locale
	helper_method :current_equipo, :current_user_session, :current_user

	def current_equipo
		if params[:equipo_id]
			logger.debug "Equipo id => #{params[:equipo_id]}"
			@current_equipo = Equipo.find(params[:equipo_id])
		elsif params[:id]
			logger.debug "Id => #{params[:id]}"
			@current_equipo = Equipo.find(params[:id])
		end

		@current_equipo 
	end
	
#  protected
#    def set_locale
#      session[:locale] = params[:locale] if params[:locale]
#      I18n.locale = session[:locale] || I18n.default_locale
#
#      locale_path = "#{LOCALES_DIRECTORY}#{I18N.locale}.yml"
#
#      unless I18n.load_path.include? locale_path
#        I18n.load_path << locale_path
#        I18n.backend.send(:init_translations)
#      end
#    rescue Exception => err
#      logger.error err
#      flash.now[:notice] = "La traducción #{I18n.locale} no se encuentra disponible"
#
#      I18n.load_path -= [locale_path]
#      I18n.locale = session[:locale] = I18n.default_locale
#    end


  private

    def current_user_session
      logger.debug "ApplicationController::current_user_session"
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      logger.debug "ApplicationController::current_user"
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      logger.debug "ApplicationController::require_user"
      unless current_user
        store_location
        flash[:notice] = "Debe iniciar sesión para acceder a esta página"
        redirect_to new_user_session_url
        return false
      end
    end

    def require_no_user
      logger.debug "ApplicationController::require_no_user"
      if current_user
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end
end
