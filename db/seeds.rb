# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

p "create Customers"
Customer.create!(
  last_name: '佐藤',
  first_name: '愛',
  last_name_kana: 'サトウ',
  first_name_kana: 'アイ',
  email: 'user1@exam.com',
  postal_code: '1111111',
  address: '東京都港区',
  password: 'aaaaaaaa',
  telephone_number: '1111111111',
)
Customer.create!(
  last_name: '橋本',
  first_name: '勇気',
  last_name_kana: 'ハシモト',
  first_name_kana: 'ユウキ',
  email: 'user2@exam.com',
  postal_code: '2222222',
  address: '東京都葛飾区',
  password: 'bbbbbbbb',
  telephone_number: '2222222222',
)
Customer.create!(
  last_name: '田中',
  first_name: '凌',
  last_name_kana: 'タナカ',
  first_name_kana: 'リョウ',
  email: 'user3@exam.com',
  postal_code: '3333333',
  address: '東京都台東区',
  password: 'cccccccc',
  telephone_number: '3333333333',
)

p "create Genres"
Genre.create!(
  name: "ケーキ"
  )

Genre.create!(
  name: "プリン"
  )

p "create Items"
Item.create!(
      name: 'ケーキ',
      introduction: '新鮮なイチゴを使用しています。',
      price: 100,
      image: File.open('./app/assets/images/img/cake.jpg'),
      is_active: true,
      genre_id: 1
)

Item.create!(
      name: 'プリン',
      introduction: 'なめらかな食感と濃厚な味わいのカスタードプリンです。',
      price: 300,
      image: File.open('./app/assets/images/img/pudding.jpg'),
      is_active: false,
      genre_id: 2
)

10.times do |n|
  Item.create!(
    name: "ケーキ#{n + 1}",
    introduction: '新鮮なイチゴを使用しています。',
    price: 100,
    image: File.open('./app/assets/images/img/no_image.jpg'),
    is_active: true,
    genre_id: 1
    )
end

