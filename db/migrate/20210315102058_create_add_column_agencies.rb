class CreateAddColumnAgencies < ActiveRecord::Migration[5.2]
  def change
    create_table :add_column_agencies do |t|

      add_column :agencies, :name, :string
      add_column :agencies, :city, :string
      add_column :agencies, :adress, :string
      add_column :agencies, :phone_number, :string
      add_column :agencies, :siren, :string

      t.timestamps
    end
  end
end
