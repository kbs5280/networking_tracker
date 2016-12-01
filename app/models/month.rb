class Month < ApplicationRecord
  has_many :month_contacts
  has_many :contacts, through: :month_contacts

  def self.list
    ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
  end
end
