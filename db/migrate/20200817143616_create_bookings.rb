class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :boat, null: false, foreign_key: true
      t.datetime :starting_date_time
      t.datetime :ending_date_time

      t.timestamps
    end
  end
end
