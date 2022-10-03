class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    #@customer = Customer.all
    @customer = current_customer
    #@customer = Customer.find(params[:id])
  end

  def edit
    @edit_public_customer = current_customer
  end

  def update
    #editで編集後、マイページ(show)に遷移する
    #@の変数は↑のeditに合わせているのではなく、render(失敗)したときの遷移先がedit画面なので、
    #そちらで使用されている@edit~と合わせる必要があり、結果的に↑と同じ変数名になる
    @edit_public_customer = current_customer
    if @edit_public_customer.update(customers_information_params)#updateのパラメータ
      redirect_to customers_my_page_path#show
    else
      render :edit
    end

  end

  def unsubscribe
    @destroy_public_customer = current_customer
    @destroy_public_customer.destroy
    redirect_to '/'#public/homes#top(トップページ)URL
  end

  def withdraw
  end

  #投稿データのストロングパラメータ(セキュリティに関係する)
  #require/permitメソッド:DBの更新時、不要なパラメータを取り除く(必要なパラメータだけに絞り込む)
  #require(パラメータ群).permit(:変更可能なパラメータ名)
  #会員情報編集(edit)をした後、updateに遷移する
  private
  def customers_information_params#updateのパラメータ
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number)
  end
end
