class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.integer :price
      t.string :image_id
      t.boolean :is_active, default: true
      t.integer :genre_id

      t.timestamps
    end
  end
end
