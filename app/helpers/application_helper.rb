module ApplicationHelper
  def recipe_material_calorie(calorie, quantity)
    calorie * quantity / 100
  end

  def weight_gain_calorie(calorie)
    calorie.to_f + 500
  end

  def weight_slim_calorie(calorie)
    calorie.to_f - 500
  end

  def weight_gain_carbo(calorie, fat, protein)
    calorie += 500
    (calorie - (protein * 4 + fat * 9)) / 4
  end

  def weight_slim_carbo(calorie, fat, protein)
    calorie -= 500
    (calorie - (protein * 4 + fat * 9)) / 4
  end

  def target_calorie_gain(eat_calorie, user_calorie)
    user_calorie = user_calorie.to_f + 500
    user_calorie - eat_calorie.to_f
  end

  def target_calorie_slim(eat_calorie, user_calorie)
    user_calorie = user_calorie.to_f - 500
    user_calorie - eat_calorie.to_f
  end

  def target_protein(eat_protein, user_protein)
    user_protein.to_f - eat_protein.to_f
  end

  def target_fat(eat_fat, user_fat)
    user_fat.to_f - eat_fat.to_f
  end

  def target_carbo_gain(eat_carbo, calorie, fat, protein)
    calorie = calorie.to_f + 500
    user_carbo = (calorie - (protein.to_f * 4 + fat.to_f * 9)) / 4
    user_carbo - eat_carbo
  end

  def target_carbo_slim(eat_carbo, calorie, fat, protein)
    calorie = calorie.to_f - 500
    user_carbo = (calorie - (protein.to_f * 4 + fat.to_f * 9)) / 4
    user_carbo - eat_carbo
  end
end
