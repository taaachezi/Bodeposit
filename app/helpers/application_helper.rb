module ApplicationHelper
  def recipe_material_calorie(calorie, quantity)
    recipe_material_calorie = calorie * quantity / 100
    recipe_material_calorie.to_f.round(1)
  end

  def weight_gain_calorie(calorie)
    weight_gain_calorie = calorie + 500
    weight_gain_calorie.to_f.round(1)
  end

  def weight_slim_calorie(calorie)
    weight_slim_calorie = calorie - 500
    weight_slim_calorie.to_f.round(1)
  end

  def weight_gain_carbo(calorie, fat, protein)
    calorie += 500
    weight_gain_carbo = (calorie - (protein * 4 + fat * 9)) / 4
    weight_gain_carbo.to_f.round(1)
  end

  def weight_slim_carbo(calorie, fat, protein)
    calorie -= 500
    weight_slim_carbo = (calorie.to_f - (protein * 4 + fat * 9)) / 4
    weight_slim_carbo.to_f.round(1)
  end

  def target_calorie_gain(eat_calorie, user_calorie)
    user_calorie = user_calorie.to_f + 500
    target_calorie_gain = user_calorie - eat_calorie
    target_calorie_gain.to_f.round(1)
  end

  def target_calorie_slim(eat_calorie, user_calorie)
    user_calorie = user_calorie.to_f - 500
    target_calorie_slim = user_calorie - eat_calorie
    target_calorie_slim.to_f.round(1)
  end

  def target_protein(eat_protein, user_protein)
    target_protein = user_protein.to_f - eat_protein.to_f
    target_protein.to_f.round(1)
  end

  def target_fat(eat_fat, user_fat)
    target_fat = user_fat - eat_fat
    target_fat.to_f.round(1)
  end

  def target_carbo_gain(eat_carbo, calorie, fat, protein)
    calorie += 500
    user_carbo = (calorie - (protein * 4 + fat * 9)) / 4
    target_carbo_gain = user_carbo - eat_carbo
    target_carbo_gain.to_f.round(1)
  end

  def target_carbo_slim(eat_carbo, calorie, fat, protein)
    calorie -= 500
    user_carbo = (calorie - (protein * 4 + fat * 9)) / 4
    target_carbo_slim = user_carbo - eat_carbo
    target_carbo_slim.to_f.round(1)
  end

end
