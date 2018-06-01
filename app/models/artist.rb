class Artist < ApplicationRecord
  has_many :albums, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :year, presence: true

  #after_initialize :lowercase_name, :if => :new_record?

  def lowercase_name
    name.downcase
  end
end
