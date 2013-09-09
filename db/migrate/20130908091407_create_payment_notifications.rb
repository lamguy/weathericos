class CreatePaymentNotifications < ActiveRecord::Migration
  def change
    create_table :payment_notifications do |t|
      t.references :user
      t.text :params
      t.string :status
      t.string :transaction_id
      t.string :create

      t.timestamps
    end
  end
end
