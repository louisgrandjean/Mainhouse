class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.belongs_to :building, index: true
      t.belongs_to :agency, foreing_key: true
      t.belongs_to :owner, foreing_key: true
      t.string :sender
      t.string :sender_last
      t.string :content   
      t.timestamps
    end
  end
end
