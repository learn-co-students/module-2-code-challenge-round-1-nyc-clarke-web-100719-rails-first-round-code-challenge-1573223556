class Heroine < ApplicationRecord
    validates :super_name, uniqueness: true

    belongs_to :power
end
