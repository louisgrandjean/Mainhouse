class Message < ApplicationRecord
  belongs_to :owner
  belongs_to :building
end
