class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.datetime :check_in_time

      t.timestamps
    end
  end
end
