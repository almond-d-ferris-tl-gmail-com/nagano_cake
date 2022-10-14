  class Public::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  # def new
  # end

  # def create
  # end
  
  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
    end
    
    def after_sign_up_path_for(resource)
      top_path#サインアップ・ログインしたらcustomerのtop画面に遷移する
    end
  end
