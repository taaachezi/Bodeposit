class MaterialsController < ApplicationController
  before_action :authenticate_user!
  def index
  	@addmaterial = Material.new
  	@materials = current_user.materials.order("genre_id")
  end

  def create
  	@addmaterial = Material.new(params_material)
  	@addmaterial.user_id = current_user.id
  	@addmaterial.calorie = Material.calorie_fit(@addmaterial.fat, @addmaterial.protein, @addmaterial.carbohydrate)
  	@addmaterial.save
  	flash[:notice] = "材料を登録しました"
  	redirect_back(fallback_location: root_path)
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
  	params.require(:material).permit(:name, :genre_id, :fat, :protein, :carbohydrate, :calorie)
  end
 
end
