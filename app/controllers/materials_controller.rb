class MaterialsController < ApplicationController
  def index
  	@addmaterial = Material.new
  	@materials = current_user.materials
  end

  def create
  	@addmaterial = Material.new(params_material)
  	@addmaterial.user_id = current_user.id
  	@addmaterial.calorie = calorie_fit(@addmaterial.fat, @addmaterial.protein, @addmaterial.carbohydrate)
  	@addmaterial.save
  	flash[:notice] = "材料を登録しました"
  	redirect_back(fallback_location: root_path)
  end

  def update
  	material = Material.find(params[:id])
  	material.update(params_material)
  	redirect_back(fallback_location: root_path)
  end

  def search
  	
  end

  private

  def params_material
  	params.require(:material).permit(:name, :genre_id, :fat, :protein, :carbohydrate, :calorie)
  end
 
end
