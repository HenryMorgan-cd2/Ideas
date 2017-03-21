class Tag < ApplicationRecord

  has_many :taggings
  has_many :ideas, through: :taggings

  validates :name, presence: true

end
