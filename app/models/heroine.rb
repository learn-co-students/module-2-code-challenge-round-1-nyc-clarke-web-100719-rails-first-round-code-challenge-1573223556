class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, uniqueness: true

    def self.search(search)
        if search 
            all.select { |heroine|
                heroine.power.name == search
            }
        else
            all
        end
    end

end
