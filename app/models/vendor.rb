class Vendor < ApplicationRecord
  has_many :comments
  belongs_to :school

  def self.search(find)
    find = "%#{find}%"
    self.where("content ilike ? or address ilike ?", find, find)
  end

end
