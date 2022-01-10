require "json"
require "rest-client"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
pages = ['1', '2', '3', '4', '5']
pages.each do |page|
  json = RestClient.get "api.open5e.com/magicitems/?format=json&page=#{page}"
  item_info = JSON.parse(json)["results"]
    item_info.each do |item|
      MagicItem.create(
      name: item["name"],
      description: item["desc"],
      item_type: item["type"],
      rarity: item["rarity"],
      attunement: item["requires_attunement"]
    )
    end
  end




