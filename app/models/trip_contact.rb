class TripContact < ApplicationRecord
  belongs_to :trip
  belongs_to :contact
end
