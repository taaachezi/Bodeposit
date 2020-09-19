# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
	[
		{
			id: 1,
			name: "山田太郎",
			email: "a@a",
			password: "111111",
			height: 170,
			weight: 70,
			level: 0,
			age: 25,
			sex: 0,
		},
		{
			id: 2,
			name: "山田花子",
			email: "b@a",
			password: "222222",
			height: 160,
			weight: 50,
			level: 1,
			age: 24,
			sex: 1
		},
  	]
)

