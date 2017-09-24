class Trip < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description, :check_in_time
end
