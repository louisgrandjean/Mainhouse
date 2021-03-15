class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.belongs_to :agency, index: true
      t.string :adress
      t.string :name
      t.string :reference
      t.string :picture
      t.timestamps
    end
  end
end
