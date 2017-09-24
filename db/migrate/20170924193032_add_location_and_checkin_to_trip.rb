class AddLocationAndCheckinToTrip < ActiveRecord::Migration[5.1]
  def change
    add_column :trips, :checked_in, :boolean, default: false
    add_column :trips, :latitude, :decimal, {:precision=>10, :scale=>6}
    add_column :trips, :longitude, :decimal, {:precision=>10, :scale=>6}
  end
end
