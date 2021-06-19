# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
  name: "ケーキ"
  )

Item.create!(
      name: 'ケーキ',
      introduction: '新鮮なイチゴを使用しています。',
      price: 100,
      image: File.open('./app/assets/images/img/cake.jpg'),
      is_active: 0,
      genre_id: 1
)