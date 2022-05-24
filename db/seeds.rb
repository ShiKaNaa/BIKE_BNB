# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bike.create([{
  name: 'Little pink bike'
  img_url: 'https://m.media-amazon.com/images/I/81E3DzhaKiL._AC_SL1500_.jpg'
  size: 'child'
  category: 'city'
},
{
  name: 'VTT Yellow adult'
  img_url: 'https://www.labo-velo.fr/3243-thickbox_default/vtt-trek-procaliber-98-sl-29-jaune-fluo-noir-2018.jpg'
  size: 'adult'
  category: 'mountain'
},
{
  name: 'Electric Dutch Bike'
  img_url: 'https://cdn.lemond.com/images/pages/dutch/Dutch_Front_3Quarter.webp'
  size: 'adult'
  category: 'electric'
},
{
  name: 'Road Bike'
  img_url: 'https://images.immediate.co.uk/production/volatile/sites/21/2020/03/Giant-TCR-Advanced-2-Disc-01-64577da.jpg?webp=true&quality=45&resize=1112%2C740'
  size: 'adult'
  category: 'road'
}])
