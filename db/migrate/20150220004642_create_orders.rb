class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :product_id, :integer
      t.string :user_id, :integer
      t.string :quantity, :integer
      t.string :product_option_id, :integer
      t.string :subtotal, :decimal
      t.string :tax, :decimal
      t.string :total, :decimal

      t.timestamps null: false
    end
  end
end
