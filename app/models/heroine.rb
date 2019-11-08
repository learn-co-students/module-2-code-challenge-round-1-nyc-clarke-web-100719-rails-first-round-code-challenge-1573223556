class Heroine < ApplicationRecord
    belongs_to :power
    validates :name, :super_name, uniqueness: true
end
