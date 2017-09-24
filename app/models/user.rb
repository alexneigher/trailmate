class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :trips
  has_many :contacts
  
  validates_uniqueness_of :full_name

  before_save :generate_unique_url_slug!

  private
    def generate_unique_url_slug!
      self.url_slug = full_name.parameterize
    end
end
