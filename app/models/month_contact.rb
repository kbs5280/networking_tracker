class MonthContact < ApplicationRecord
  belongs_to :month
  belongs_to :contact

end
