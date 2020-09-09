module ApplicationHelper
	def weight_gain(calorie, fat, protein)
		calorie = calorie + 500
		(calorie - (protein*4+fat*9))/4
	end
	def weight_slim(calorie, fat, protein)
		calorie = calorie - 500
		(calorie- (protein*4+fat*9))/4
	end
end
