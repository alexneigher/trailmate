class Trip < ApplicationRecord
  belongs_to :user

  has_many :trip_contacts
  has_many :contacts, through: :trip_contacts
  has_and_belongs_to_many :contacts, join_table: 'trip_contacts'

  accepts_nested_attributes_for :trip_contacts

  validates_presence_of :title, :description, :check_in_time, :latitude, :longitude


  def check_in_time_has_past?
    DateTime.now >= check_in_time
  end
end
