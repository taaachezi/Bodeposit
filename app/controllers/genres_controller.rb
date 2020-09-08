class GenresController < ApplicationController
  before_action :set_method
  def new
  end

  def create
  	@addgenre = Genre.new(params_genre)
  	@addgenre.user_id = current_user.id
  	@addgenre.save
  	flash[:notice] = "ジャンルを追加しました"
  end

  def update
    @addgenre = Genre.new
  	@genre.update(params_genre)
  	flash[:notice] = "ジャンルを変更しました"
  end

  private

  def params_genre
  	params.require(:genre).permit(:name, :status)
  end

  def set_method
    @genre = Genre.find_by(id: params[:id])
    @genres = current_user.genres
    @addgenre = Genre.new
  end

end

