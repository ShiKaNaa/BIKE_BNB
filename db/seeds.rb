# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bike.destroy_all
User.destroy_all
Booking.destroy_all

lucie = User.create!(
  email:'lucie@gmail.com',
  password: 'azerty',
  firstname: 'Lucie',
  lastname: 'Petitprez'

)

emma = User.create!(
  email: 'emma@gmail.com',
  password: 'azerty',
  firstname: 'Emma',
  lastname: 'Watson'
)

raphael = User.create!(
  email: 'raphael@gmail.com',
  password: 'azerty',
  firstname: 'Raphael',
  lastname: 'Handsome'
)

virginie = User.create!(
  email: 'virginie@gmail.com',
  password: 'azerty',
  firstname: 'Virginie',
  lastname: 'Handsome'
)

marion = User.create!(
  email: 'marion@gmail.com',
  password: 'azerty',
  firstname: 'Marion',
  lastname: 'Handsome'
)

Bike.create!([{
  name: 'Pink bike for kids',
  img_url: 'https://m.media-amazon.com/images/I/81E3DzhaKiL._AC_SL1500_.jpg',
  size: 'child',
  category: 'city',
  price: 5,
  city: "Lille",
  user: lucie
},
{
  name: 'Yellow Mountain Bike',
  img_url: 'https://www.labo-velo.fr/3243-thickbox_default/vtt-trek-procaliber-98-sl-29-jaune-fluo-noir-2018.jpg',
  size: 'adult',
  category: 'mountain',
  price: 15,
  city: "Lyon",
  user: emma
},
{
  name: 'Blue Mountain Bike',
  img_url: 'https://www.picclickimg.com/d/l400/pict/304480950325_/V%C3%A9lo-de-montagne-VTT-adulte-full-suspendu-Kona.jpg',
  size: 'adult',
  category: 'mountain',
  price: 15,
  city: "Lyon",
  user: emma
},
{
  name: 'Electric Dutch Bike',
  img_url: 'https://cdn.lemond.com/images/pages/dutch/Dutch_Front_3Quarter.webp',
  size: 'adult',
  category: 'electric',
  price: 30,
  city: "Lille",
  user: lucie
},
{
  name: 'Road Bike',
  img_url: 'https://images.immediate.co.uk/production/volatile/sites/21/2020/03/Giant-TCR-Advanced-2-Disc-01-64577da.jpg?webp=true&quality=45&resize=1112%2C740',
  size: 'adult',
  category: 'road',
  price: 20,
  city: "Lyon",
  user: lucie
},
{
  name: 'Awesome Road Bike',
  img_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTvfeXZtGEKlUwbBW00FbNTOI8MTImi4mJb5INdkMZRh3yb1E72xu0Hxbcd3pOhReMx9Q&usqp=CAU',
  size: 'adult',
  category: 'road',
  price: 30,
  city: "Paris",
  user: virginie
},
{
  name: 'Electric Dutch Bike for Day-use',
  img_url: 'https://ekstere.eco/media/catalog/product/cache/fb88231ff4793a37172f60e2136670e8/p/e/peugeot_eco9_2_1.jpg',
  size: 'adult',
  category: 'electric',
  price: 40,
  city: "Rennes",
  user: marion
},
{
  name: 'Blue Mountain Bike',
  img_url: 'https://www.picclickimg.com/d/l400/pict/304480950325_/V%C3%A9lo-de-montagne-VTT-adulte-full-suspendu-Kona.jpg',
  size: 'adult',
  category: 'mountain',
  price: 15,
  city: "Strasbourg",
  user: raphael
}])

Booking.create!([{
  comment: "Nice bike, can I borrow it for a ride? ",
  start_date: Time.now,
  end_date: Time.new(2022, 6, 6),
  status: "Pending 🕐",
  bike: Bike.first,
  user_id: emma.id
},
{
  comment: "Awesome bike, lend it to me instead! ",
  start_date: Time.now,
  end_date: Time.new(2022, 6, 6),
  status: "Pending 🕐",
  bike: Bike.last,
  user_id: emma.id
},
{
  comment: "I'd love to borrow it for a ride with my friends. Is it available?",
  start_date: Time.now,
  end_date: Time.new(2022, 6, 6),
  status: "Pending 🕐",
  bike: Bike.last,
  user_id: raphael.id
}])
