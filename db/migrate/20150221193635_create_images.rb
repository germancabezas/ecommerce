class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :image_url, :string
      t.string :product_id, :integer

      t.timestamps null: false
    end
  end
end
