class MaterialsController < ApplicationController
  before_action :authenticate_user!
  
  def index
  	set_material
  end

  def create
  	@addmaterial = Material.new(params_material)
    genre = params[:material][:genre_id]
    if genre == "" || @addmaterial.save == false
      flash[:error] = "入力されていない項目があります"
      set_material
      render :index
    else
      @addmaterial.genre_id = @addmaterial.genre.id
    	@addmaterial.user_id = current_user.id
    	@addmaterial.calorie = Material.calorie_fit(@addmaterial.fat, @addmaterial.protein, @addmaterial.carbohydrate)
    	@addmaterial.save == false
    	flash[:notice] = "材料を登録しました"
    	redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  	material = Material.find_by(id: params[:id], genre_id: params[:genre_id])
  	material.destroy
  	redirect_back(fallback_location: root_path)
  end

  def search
  	@addmaterial = Material.new
  	if @genre = Genre.find_by(id: params[:genre_id])
    	@materials = Material.where(user_id: current_user.id, genre_id: @genre.id)
   	  render "index"
    else
      redirect_back(fallback_location: root_path)
    end

  end

  private

  def params_material
  	params.require(:material).permit(:user_id, :name, :genre_id, :fat, :protein, :carbohydrate, :calorie)
  end

  def set_material
    @addmaterial = Material.new
    @materials = current_user.materials.order("genre_id")
  end

end
