class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, :null => false
      t.string :desc, :null => false
      t.string :SKU, :limit => 1, :null => false
      t.string :category, :null => false

      t.timestamps
    end
  end
end
