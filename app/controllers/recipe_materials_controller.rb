class RecipeMaterialsController < ApplicationController

	def new
		@recipe = Recipe.find(params[:recipe_id])
		@recipe_material = RecipeMaterial.new
		@recipe_materials = @recipe.recipe_materials.all
	end

	def create
		@recipe = Recipe.find(params[:recipe_id])
		@recipe_material = RecipeMaterial.new(params_recipe_material)
		@recipe_material.recipe_id = @recipe.id
		@recipe_material.material_id = @recipe_material.material.id
		@recipe_material.save
		redirect_back(fallback_location: root_path)
	end

	def destroy
		@recipe_material = RecipeMaterial.find(params[:id])
		@recipe_material.destroy
		redirect_back(fallback_location: root_path)
	end


	private

	def params_recipe_material
		params.require(:recipe_material).permit(:material_id, :quantity)
	end

end
