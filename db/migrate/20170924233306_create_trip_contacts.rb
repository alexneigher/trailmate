class CreateTripContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :trip_contacts do |t|
      t.references :trip, foreign_key: true
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
