class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :building
  has_many :messages

  after_create :welcome_send

  def welcome_send
    OwnerMailer.welcome_email(self).deliver_now
  end

end
