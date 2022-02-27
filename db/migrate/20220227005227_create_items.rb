class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.decimal :price

      t.timestamps
    end
    add_index :items, :code
  end
end
