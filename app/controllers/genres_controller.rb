class GenresController < ApplicationController
  before_action -> {
    set_genre
  }
  
  def create
    @addgenre = Genre.new(params_genre)
    @addgenre.user_id = current_user.id
    genre_name = current_user.genres.pluck(:name)
    if genre_name.include?(params[:genre][:name])
      flash[:error] = "登録済です"
      set_genre
    elsif @addgenre.save == false
      flash[:error] = "空欄です"
      set_genre
    else
      @addgenre.save
      flash[:notice] = "登録しました"
      set_genre
    end
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(status: params[:genre][:status])
    set_genre
    flash[:notice] = "変更しました"
  end

  def destroy
    @genre.destroy
    set_genre
    flash[:notice] = "削除しました"
  end

  private

  def params_genre
    params.require(:genre).permit(:name, :status, :user_id)
  end

  def set_genre
    @genre = Genre.find_by(id: params[:id])
    @genres = current_user.genres
    @addgenre = Genre.new
  end
end
