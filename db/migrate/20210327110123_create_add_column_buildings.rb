class CreateAddColumnBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :add_column_buildings do |t|
      add_column :buildings, :zip_code, :string
      add_column :buildings, :city, :string
      t.timestamps
    end
  end
end
