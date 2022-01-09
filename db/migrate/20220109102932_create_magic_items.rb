class CreateMagicItems < ActiveRecord::Migration[6.1]
  def change
    create_table :magic_items do |t|
      t.string :name
      t.string :item_type
      t.string :description
      t.string :rarity
      t.string :attunement

      t.timestamps
    end
  end
end
