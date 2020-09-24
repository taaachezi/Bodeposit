class Batch::DataReset

	def self.data_reset
		Eat.delete_all
		p "摂取情報をクリアしました"
	end
	
end