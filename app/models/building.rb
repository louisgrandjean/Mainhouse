class Building < ApplicationRecord
    belongs_to :agency
    has_many :owners
    has_many :events
    has_many :messages 
    

end