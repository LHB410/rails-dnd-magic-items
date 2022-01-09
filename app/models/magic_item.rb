class MagicItem < ApplicationRecord
  validates :name, presence: true
  validates :item_type, presence: true
  validates :rarity, presence: true
  validates :description, presence: true
end
