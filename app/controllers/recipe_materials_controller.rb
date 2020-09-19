class RecipeMaterialsController < ApplicationController

	def new
		@recipe = Recipe.find(params[:recipe_id])
		@recipe_material = RecipeMaterial.new
		@recipe_materials = @recipe.recipe_materials.all
	end
	

	def create
		# genre.materialsで選択可能にする
		if params[:genre_id]
			if params[:genre_id].present?
				@genre = Genre.find(params[:genre_id])
			end
			@recipe = Recipe.find(params[:recipe_id])
			@recipe_materials = @recipe.recipe_materials.all
			@recipe_material = RecipeMaterial.new
			render :new
		else
			@recipe = Recipe.find(params[:recipe_id])
			if params_recipe_material
				@recipe_material = RecipeMaterial.new(params_recipe_material)
			else
				@recipe_material = RecipeMaterial.new(material_id: params[material_id], quantity: params[quantity])
			end
			@recipe_material.recipe_id = @recipe.id
			@recipe_material.material_id = @recipe_material.material.id
			@recipe_material.save
			redirect_to new_recipe_recipe_material_path
		end
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
