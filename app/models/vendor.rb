class Vendor < ApplicationRecord
  has_many :comments
  belongs_to :school, optional: true

  def self.search(find)
    find = "%#{find}%"
    self.where("content ilike ? or address ilike ?", find, find)
  end

end
