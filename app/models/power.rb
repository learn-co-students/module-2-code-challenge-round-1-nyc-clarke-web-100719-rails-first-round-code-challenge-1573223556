class Power < ApplicationRecord
    has_many :heroines, dependent: :destroy
    validates :name, uniqueness: true
    validates :description,length: { in: 25..200 }
end
