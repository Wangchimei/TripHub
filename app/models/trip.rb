class Trip < ApplicationRecord
  include ImageResult

  enum status: { planning: 0, finished: 1}
  scope :open, -> { where(privacy: false) }
  scope :completed, -> { where(status: "finished") }
  scope :planning, -> { where(status: "planning") }
  scope :other_users, -> (user){ where.not(user_id: user.id) }

  belongs_to :user

  has_many :schedules, dependent: :destroy
  has_many :to_countries, dependent: :destroy
  has_many :to_states, dependent: :destroy
  has_many :to_cities, dependent: :destroy
  has_many :destination_countries, through: :to_countries, source: :country
  has_many :destination_states, through: :to_states, source: :state
  has_many :destination_cities, through: :to_cities, source: :city
  accepts_nested_attributes_for :to_countries, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :to_states, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :to_cities, allow_destroy: true, reject_if: :all_blank

  after_validation :check_schedule
  after_save :set_default_img

  validates :name, :start_day, :end_day, :to_countries, presence: true
  validates :name, length: { maximum: 50 }
  validate :start_end_check

  def self.to_country_build
    trip = self.new
    trip.to_countries.build
    trip
  end

  def self.to_state_build
    trip = self.new
    trip.to_states.build
    trip
  end

  def self.to_city_build
    trip = self.new
    trip.to_cities.build
    trip
  end

  def set_default_img
    if self.trip_image.nil?
      if self.destination_states.present?
        search_term = "#{self.destination_states.first.name} #{self.destination_countries.first.name}"
      else
        search_term = "#{self.destination_countries.first.name}"
      end
      url = ImageResult.get_url(search_term)
      self.update(trip_image: url)
    end
  end

  def check_schedule
    if (self.start_day && self.end_day) && (self.start_day_changed? || self.end_day_changed?)
    old_schedule = self.schedules.where.not(start_time: (self.start_day.beginning_of_day..self.end_day.end_of_day))
    old_schedule.destroy_all
    end
  end

  def start_end_check
    if (self.start_day && self.end_day) && (self.end_day < self.start_day)
      errors.add(:end_day, "の日付を正しく記入してください。")
    end
  end
end
