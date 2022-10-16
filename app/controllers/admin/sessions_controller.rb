class Admin::SessionsController < Devise::SessionsController
  
  #ログイン後に表示する画面
  def after_sign_in_path_for(resource)
      admin_root_path#admin/homes#top
  end

  #ログアウト後に表示する画面
  def after_sign_out_path_for(resource)
      new_admin_session_path#admin/sessions#new
  end

end
