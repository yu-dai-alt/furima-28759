class ApplicationController < ActionController::Base
  class MyLogger < Logger
    include ActiveSupport::LoggerSilence
  end
  before_action :mylogger_test
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :basic_auth
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end
  
  # def basic_auth
  #   authenticate_or_request_with_http_basic do |username, password|
  #     username == 'admin' && password == '2222'
  #   end
  # end

  def mylogger_test
    mylogger = MyLogger.new(STDOUT)
    mylogger.silence do
      mylogger.debug("controller = #{controller_name}")
      mylogger.info("action = #{action_name}")
      mylogger.error("controler#action = #{controller_name}##{action_name}")
    end
  end
end

