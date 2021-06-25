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

Genre.create!(
  name: "焼き菓子"
  )

Genre.create!(
  name: "キャンディ"
  )



p "create Items"
Item.create!(
      name: 'いちごのショートケーキ',
      introduction: '長野県産の章姫（あきひめ）をふんだんに使用したショートケーキです。いちごとクリームの甘さがマッチした安定感のある美味しさをお楽しみください。',
      price: 390,
      image: File.open('./app/assets/images/img/shortcake.jpg'),
      is_active: true,
      genre_id: 1
)

Item.create!(
      name: 'アップルパイ',
      introduction: '長野県産のりんごを使用したアップルパイです。サクサクのパイとたっぷりはいった濃厚なカスタードクリームがさっぱりとしたりんごとマッチした当店イチオシの商品です。',
      price: 450,
      image: File.open('./app/assets/images/img/applepie.jpg'),
      is_active: false,
      genre_id: 1
)

Item.create!(
      name: 'レモンケーキ',
      introduction: 'レモンのさっぱりとした風味を味わえるケーキです。',
      price: 390,
      image: File.open('./app/assets/images/img/lemoncake.jpg'),
      is_active: false,
      genre_id: 1
)

Item.create!(
      name: 'ティラミス',
      introduction: '甘さ控えめのティラミスです',
      price: 460,
      image: File.open('./app/assets/images/img/tiramisu.jpg'),
      is_active: false,
      genre_id: 1
)

Item.create!(
      name: 'ラズベリーのロールケーキ',
      introduction: 'ラズベリーを使用したロールケーキです。',
      price: 350,
      image: File.open('./app/assets/images/img/rollcake.jpg'),
      is_active: false,
      genre_id: 1
)

Item.create!(
      name: 'パンケーキ',
      introduction: 'ラズベリーのパンケーキです。',
      price: 350,
      image: File.open('./app/assets/images/img/pancake.jpg'),
      is_active: false,
      genre_id: 1
)

Item.create!(
      name: 'くるみのパウンドケーキ',
      introduction: 'くるみを使用したパウンドケーキです。',
      price: 350,
      image: File.open('./app/assets/images/img/poundcake.jpg'),
      is_active: false,
      genre_id: 1
)

Item.create!(
      name: 'プリン',
      introduction: 'なめらかな食感と濃厚な味わいのカスタードプリンです。',
      price: 300,
      image: File.open('./app/assets/images/img/pudding2.jpg'),
      is_active: false,
      genre_id: 2
)

Item.create!(
      name: 'マカロン',
      introduction: '５色のマカロンです。',
      price: 300,
      image: File.open('./app/assets/images/img/macaroons.jpg'),
      is_active: false,
      genre_id: 3
)

Item.create!(
      name: 'りんごあめ（６本セット）',
      introduction: '様々なコーティングをしたりんごあめのセットです。',
      price: 1000,
      image: File.open('./app/assets/images/img/apple_candy.jpg'),
      is_active: false,
      genre_id: 4
)

Item.create!(
      name: 'ラズベリーチーズケーキ',
      introduction: 'ラズベリーを使用したチーズケーキです。',
      price: 430,
      image: File.open('./app/assets/images/img/cheesecake.jpg'),
      is_active: false,
      genre_id: 1
)

Item.create!(
      name: '煮りんご入り紅茶マフィン',
      introduction: '長野県産のりんごを使用した紅茶のマフィンです。',
      price: 350,
      image: File.open('./app/assets/images/img/muffin.jpg'),
      is_active: false,
      genre_id: 3
)

Item.create!(
      name: 'いちごのティラミス',
      introduction: '長野県産の章姫（あきひめ）を使用したホワイトティラミスです。',
      price: 460,
      image: File.open('./app/assets/images/img/muffin.jpg'),
      is_active: false,
      genre_id: 1
)

Item.create!(
      name: 'いちごのシフォンケーキ',
      introduction: '長野県産の章姫（あきひめ）を使用したシフォンケーキです。たっぷりのいちごと生クリームがふわふわの生地と合わさった至福のケーキです。',
      price: 2800,
      image: File.open('./app/assets/images/img/cake.jpg'),
      is_active: false,
      genre_id: 1
)



