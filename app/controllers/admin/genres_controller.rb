class Admin::GenresController < ApplicationController
  def index#ジャンル一覧・追加画面
    #新規作成
    @genre = Genre.new
    #一覧表示
    @index_admin_genre = Genre.all
  end

  def create
    #indexで新規登録後、ジャンル一覧・追加ページ(indexのパス)に遷移する
    @genre = Genre.new(admin_genre_params)#updateのパラメータ
    if @genre.save
      redirect_to admin_genres_path#indexのパス
    else
      render :index
    end
  end

  def edit#ジャンル編集画面
    @edit_admin_genre = Genre.find(params[:id])
    #if @edit_admin_genre.admin == current_admin
      #redirect_to admin_genres_path
    #end
  end

  def update
    #editで編集後、ジャンル一覧・追加ページに遷移する
    #@の変数は↑のeditに合わせているのではなく、render(失敗)したときの遷移先がedit画面なので、
    #そちらで使用されている@edit~と合わせる必要があり、結果的に↑と同じ変数名になる
    @edit_admin_genre = Genre.find(params[:id])
    if @edit_admin_genre.update(admin_genre_params)#updateのパラメータ
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private
  def admin_genre_params
    params.require(:genre).permit(:name)
  end
  
end
