class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
