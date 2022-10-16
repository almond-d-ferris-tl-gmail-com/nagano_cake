class Admin::GenresController < ApplicationController
  # ログインしていない場合、ヘッダーのボタンをクリックしたら強制的にログイン画面に移動する
  # except→ログイン画面への遷移を除外する→今回は除外するものがない
  before_action :authenticate_admin!

  def index#ジャンル一覧・追加画面
    #新規作成
    @genre = Genre.new
    #一覧表示
    @index_admin_genre = Genre.all
  end

  def create
    #indexで新規登録後、ジャンル一覧・追加ページ(index)に遷移する
    @genre = Genre.new(admin_genre_params)#updateのパラメータ
    if @genre.save
      redirect_to admin_genres_path#indexのパス
    else
      render :index
    end
  end

  def edit#ジャンル編集画面
    @edit_admin_genre = Genre.find(params[:id])
  end

  def update
    #editで編集後、ジャンル一覧・追加(index)に遷移する
    #@の変数は↑のeditに合わせているのではなく、render(失敗)したときの遷移先がedit画面なので、
    #そちらで使用されている@edit~と合わせる必要があり、結果的に↑と同じ変数名になる
    @edit_admin_genre = Genre.find(params[:id])
    if @edit_admin_genre.update(admin_genre_params)#updateのパラメータ
      redirect_to admin_genres_path#index
    else
      render :edit
    end
  end

  private#editで編集可能部分
  def admin_genre_params#update
    params.require(:genre).permit(:name)
  end
  
end
