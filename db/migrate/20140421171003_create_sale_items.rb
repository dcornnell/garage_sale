class CreateSaleItems < ActiveRecord::Migration
  def change
    create_table :sale_items do |t|
      t.string :name
      t.text :description
      t.integer :age
      t.decimal :price
      t.boolean :sold, default: false

      
    end
  end
end
