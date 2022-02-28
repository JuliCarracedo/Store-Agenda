class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.integer :price #Prices are expressed in cents in the database

      t.timestamps
    end
    add_index :items, :code
  end
end
