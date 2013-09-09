class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :text
      t.integer :price
      t.integer :sale

      t.timestamps
    end
  end
end
