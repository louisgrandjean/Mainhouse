class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :owner, index: true
      t.belongs_to :building, index: true

      t.string :content 
      
      t.timestamps
    end
  end
end
