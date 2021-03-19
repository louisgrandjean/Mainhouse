class CreateAddColumnOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :add_column_owners do |t|
      add_reference :owners, :building, foreign_key: true
      add_column :owners, :first_name, :string
      add_column :owners, :last_name, :string
      add_column :owners, :phone_number, :string
      add_column :owners, :lot, :integer
      t.timestamps
    end
  end
end
