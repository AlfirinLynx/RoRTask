class CreateWagons < ActiveRecord::Migration
  def change
    create_table :wagons do |t|
      t.string :number
      t.string :wagon_type
      t.integer :lower_seats
      t.integer :upper_seats

      t.timestamps null: false
    end
  end
end
