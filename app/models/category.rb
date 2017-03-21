class Category < ApplicationRecord
  has_many :ideas, dependent: :nullify

  validates :name, :machine_name, :color, presence: true

  before_validation do
    self.machine_name = name.parameterize
  end

end
