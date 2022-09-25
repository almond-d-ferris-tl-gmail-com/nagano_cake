class Admin::GenresController < ApplicationController
  def index
    #新規作成
    @genre = Genre.new
    #一覧表示
    @index_admin_genre = Genre.all
  end

  def create
    @genre = Genre.new(admin_genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def edit
    @edit_admin_genre = Genre.find(params[:id])
    #if @book.user != current_user
          #redirect_to books_path
    #end
  end

  def update
  end

  private
  def admin_genre_params
    params.require(:genre).permit(:name)
  end
  
end
