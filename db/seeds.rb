require "json"
require "rest-client"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


json = RestClient.get 'https://api.open5e.com/magicitems/?format=json'
item_info = JSON.parse(json)["results"]
  item_info.first(20).each do |item|
    MagicItem.create(
    name: item["name"],
    description: item["desc"],
    item_type: item["type"],
    rarity: item["rarity"],
    attunement: item["requires_attunement"]
  )
  end
# response = RestClient.get "https://www.dnd5eapi.co/api/magic-items/"
# repos = JSON.parse(response)["results"]
# ids = repos.sample(10)
# ids.each do |item|
#   json = RestClient.get "https://www.dnd5eapi.co/api/magic-items/#{item}"
#   item_info = JSON.parse(json)
#   item = MagicItem.create(
#     name: item["name"],
#     description: item["desc"]
#   )
# end



