class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :country
  belongs_to :state, optional: true
  belongs_to :city, optional: true

  has_many :trips, dependent: :destroy
  has_many :userspots, dependent: :destroy
end
