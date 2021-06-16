class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :shipping_fee
      t.integer :payment_amount
      t.integer :payment_method, default: 0
      t.integer :status, default: 0
      t.string :postal_code
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
