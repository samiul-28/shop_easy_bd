class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def admin?
    role == 'admin'
  end

  has_one :cart, dependent: :destroy
  has_many :orders, dependent: :destroy

  after_create :create_cart
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
