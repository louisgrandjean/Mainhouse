class Building < ApplicationRecord
    belongs_to :agency
    has_many :owners
end
