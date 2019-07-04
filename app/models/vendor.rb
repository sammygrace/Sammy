class Vendor < ApplicationRecord
  has_many :comments
  belongs_to :school
end
