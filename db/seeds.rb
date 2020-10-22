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
			name: "guest",
			email: "a@a",
			password: "111111",
			height: 170,
			weight: 70,
			level: 1,
			age: 26,
			sex: 0,
		},
		{
			id: 2,
			name: "岩井道正",
			email: "b@b",
			password: "222222",
			height: 168,
			weight: 60,
			level: 0,
			age: 34,
			sex: 0,
		},
		{
			id: 3,
			name: "広瀬愛",
			email: "c@c",
			password: "333333",
			height: 160,
			weight: 50,
			level: 2,
			age: 21,
			sex: 1,
		},
		{
			id: 4,
			name: "原口雅範",
			email: "d@d",
			password: "444444",
			height: 182,
			weight: 78,
			level: 0,
			age: 53,
			sex: 0,
		},
		{
			id: 5,
			name: "北川雅美",
			email: "e@e",
			password: "555555",
			height: 155,
			weight: 53,
			level: 1,
			age: 33,
			sex: 1,
		},
		{
			id: 6,
			name: "管理者",
			email: "f@f",
			password: "11angus16",
			height: 173,
			weight: 73,
			level: 0,
			age: 26,
			sex: 0,
			admin: true,
		},
  	]
)

Genre.create!(
	[
		{
			id: 1,
			user_id: 1,
			name: "肉",
			status: 1,
		},
		{
			id: 2,
			user_id: 1,
			name: "米",
			status: 1,
		},
		{
			id: 3,
			user_id: 1,
			name: "野菜",
			status: 1,
		},
		{
			id: 4,
			user_id: 1,
			name: "液体",
			status: 1,
		}
	]
)

Material.create!(
	[
		{
			id: 1,
			user_id: 1,
			genre_id: 1,
			name: "牛肉（バラ）",
			carbohydrate: 0.2,
			protein: 14.4,
			fat: 32.9,
			calorie: 371,
		},
		{
			id: 2,
			user_id: 1,
			genre_id: 1,
			name: "豚肉（バラ）",
			carbohydrate: 0.1,
			protein: 14.2,
			fat: 34.6,
			calorie: 386,
		},
		{
			id: 3,
			user_id: 1,
			genre_id: 1,
			name: "鶏肉（胸肉）",
			carbohydrate: 0,
			protein: 19.5,
			fat: 11.6,
			calorie: 191,
		},
		{
			id: 4,
			user_id: 1,
			genre_id: 2,
			name: "白米",
			carbohydrate: 77.1,
			protein: 6.1,
			fat: 0.9,
			calorie: 356,
		},
		{
			id: 5,
			user_id: 1,
			genre_id: 2,
			name: "玄米",
			carbohydrate: 35.6,
			protein: 2.8,
			fat: 1,
			calorie: 165,
		},
		{
			id: 6,
			user_id: 1,
			genre_id: 3,
			name: "ブロッコリー",
			carbohydrate: 5.2,
			protein: 4.3,
			fat: 0.5,
			calorie: 33,
		},
		{
			id: 7,
			user_id: 1,
			genre_id: 3,
			name: "納豆",
			carbohydrate: 12.1,
			protein: 16.5,
			fat: 10,
			calorie: 200,
		},
		{
			id: 8,
			user_id: 1,
			genre_id: 4,
			name: "牛乳",
			carbohydrate: 4.8,
			protein: 3.3,
			fat: 3.8,
			calorie: 67,
		},
		{
			id: 9,
			user_id: 1,
			genre_id: 4,
			name: "プロテイン（水）",
			carbohydrate: 4,
			protein: 82,
			fat: 7.5,
			calorie: 412,
		}
	]
)





