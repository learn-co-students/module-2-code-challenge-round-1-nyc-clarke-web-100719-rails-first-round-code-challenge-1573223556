class Power < ApplicationRecord
    has_many :heroines, dependent: :destroy

    validates :name, uniqueness: true
end
