class EatsController < ApplicationController
	def create
		# recipeを摂取する
		if params["recipe_id"]
			recipe = Recipe.find(params[:recipe_id])
			eat = current_user.eats.new
			eat.recipe_id = recipe.id
			eat.protein = recipe.protein.to_f
			eat.fat = recipe.fat.to_f
			eat.carbohydrate = recipe.carbohydrate.to_f
			eat.calorie = recipe.calorie.to_f
			eat.save
		else
		# materialを摂取する
			eat = current_user.eats.new(params_eat)
			eat.material_id = eat.material.id
			eat.protein = eat.material.protein * eat.quantity/100
			eat.fat = eat.material.fat * eat.quantity/100
			eat.carbohydrate = eat.material.carbohydrate * eat.quantity/100
			eat.calorie = Material.calorie_fit(eat.fat, eat.protein, eat.carbohydrate)
			eat.save
		end
		redirect_to user_top_path(current_user.id)
	end

	def destroy
		eat = Eat.find(params[:eat_id])
		eat.destroy
		redirect_back(fallback_location: root_path)
	end

	def params_eat
		params.require(:eat).permit(:material_id, :protein, :fat, :carbohydrate, :calorie, :quantity)
	end

end
