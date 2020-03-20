class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.text :accessible_item
      t.string :email
      t.text :location
      t.integer :phone

      t.timestamps
    end
  end
end
