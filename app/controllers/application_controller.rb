class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :set_locale
  
  protected
    def set_locale
      session[:locale] = params[:locale] if params[:locale]
      I18n.locale = session[:locale] || I18n.default_locale
      
      locale_path = "#{LOCALES_DIRECTORY}#{I18N.locale}.yml"
      
      unless I18n.load_path.include? locale_path
        I18n.load_path << locale_path
        I18n.backend.send(:init_translations)
      end
    rescue Exception => err
      logger.error err
      flash.now[:notice] = "La traducción #{I18n.locale} no se encuentra disponible"
      
      I18n.load_path -= [locale_path]
      I18n.locale = session[:locale] = I18n.default_locale
    end
end
