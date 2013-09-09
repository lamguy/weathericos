class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :item
      t.integer :amount
      t.string :status

      t.timestamps
    end
  end
end
