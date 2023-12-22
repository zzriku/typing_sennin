# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#管理人のデータ
Admin.create!(
  email: 'admin@admin.com',
  password: 'sennin'
)

#ユーザーのデータ
User.create!(
email: 'user1@user.com',
handle: '山田太郎',
password: 'sennin'
)

User.create!(
email: 'user2@user.com',
handle: 'キーボード大好き男',
password: 'sennin'
)

User.create!(
email: 'user3@user.com',
handle: 'typing_warrior',
password: 'sennin'
)