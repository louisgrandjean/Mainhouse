class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :building

  has_many :messages

  after_create :invite_owner

  def invite_owner
    owner = Owner.new
    owner.invite!(email: owner.email)
  end
    
end
