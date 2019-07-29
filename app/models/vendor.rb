class Vendor < ApplicationRecord
  has_many :comments
  belongs_to :school, optional: true
  belongs_to :user, optional: true

  geocoded_by :address
  after_validation :geocode, optional: true

  def set_random_address!
    self.address = RandomAddress.new.random
    save
  end

  def self.search(find)
    find = "%#{find}%"
    self.where("content ilike ? or address ilike ?", find, find)
  end

  def claim!(user)
    self.user = user
    save
  end

end
