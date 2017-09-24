class Trip < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :description, :check_in_time


  def check_in_time_has_past?
    DateTime.now >= check_in_time
  end
end
