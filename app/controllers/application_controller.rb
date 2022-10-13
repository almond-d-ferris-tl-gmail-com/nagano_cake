class ApplicationController < ActionController::Base
  # ログインしていない場合、ヘッダーのボタンをクリックしたら強制的にログイン画面に移動する
  # except→ログイン画面への遷移を除外する→topボタンを押したらtopに遷移する
  #before_action :authenticate_customer!, except: [:top]#customer→テーブル名

  protect_from_forgery with: :exception
  # ログイン後の遷移先を変更
    before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)#ログイン後の画面(public/homes#top)
    top_path(current_user)
  end

  def after_sign_out_path_for(resource)#ログアウト後の画面(public/homes#top)
    top_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  end
end
