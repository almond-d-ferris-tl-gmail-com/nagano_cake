class Public::SessionsController < Devise::SessionsController
  
before_action :customer_state, only: [:create]

protected
  # 退会しているかを判断するメソッド、退会後は同じアカウントで利用できない
  def customer_state
    # 【処理内容1】 入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@customer
    # 【処理内容2】 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
    if @customer.valid_password?(params[:customer][:password])
    # 【処理内容3】 「1」と「2」の処理が真(true)+そのアカウントのis_deletedカラムに格納されている値が
    #   trueなら退会済→サインアップ画面に遷移、falseなら未退会→そのままcreateアクションを実行
      if (@customer.is_deleted == true)
        #public/registrations#new(顧客ログイン画面)
        redirect_to new_customer_registration_path, notice:"退会済みのアカウントです。新規登録をしてください。"
      end
    end
  end

  #ログイン後に表示する画面
  def after_sign_in_path_for(resource)
      top_path#public/homes#top
  end

  #ログアウト後に表示する画面
  def after_sign_out_path_for(resource)
      top_path#public/homes#top
  end

end