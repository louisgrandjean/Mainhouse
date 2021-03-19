class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :building, index: true
      t.datetime :datetime
      t.integer :duration
      t.string :title
      t.string :description
      t.timestamps
    end
  end
end
