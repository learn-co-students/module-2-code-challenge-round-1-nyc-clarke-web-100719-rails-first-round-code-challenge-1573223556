class Power < ApplicationRecord
  has_many :heroines

  validates :name, :description, presence: true
end
