class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :country
  belongs_to :state, optional: true
  belongs_to :city, optional: true

  has_many :trips, dependent: :destroy
  has_many :user_spots, dependent: :destroy
  has_many :saved_spots, through: :user_spots, source: :spot
  has_many :visited_countries, dependent: :destroy
  has_many :countries_conquered, through: :visited_countries, source: :country
  has_many :user_schedules, through: :trips, source: :schedules

  has_many :active_relationships, foreign_key: :follower_id, class_name: "Relationship", dependent: :destroy
  has_many :passive_relationships, foreign_key: :followed_id, class_name: "Relationship", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, :country, presence: true
  before_save :set_default_avatar

  def save_spot!(spot)
    user_spots.create!(spot_id: spot.id)
  end

  def unsave_spot!(spot)
    user_spots.find_by(spot_id: spot.id).destroy
  end

  def visited!(countries)
    visited_countries.create!(country_id: countries.first.id)
  end

  def unvisited!(countries)
    visited_countries.find_by(country_id: countries.first.id).destroy
  end

  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end

  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def set_default_avatar
    if self.avatar.url.nil?
      path = File.join(Rails.root, 'app/assets/images/avatars', "avatar_#{rand(6).to_s}.png")
      File.open(path) do |file|
        self.avatar = file
      end
      self.save!
    end
  end

  def update_without_current_password(params, *options)
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    result = update(params, *options)
    clean_up_passwords
    result
  end
end
