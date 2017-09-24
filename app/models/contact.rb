class Contact < ApplicationRecord
  belongs_to :user

  validates_presence_of :full_name

  validates :phone_number, :presence => true, :if => "email.blank?"
  validates :email, :presence => true, :if => "phone_number.blank?"
end
