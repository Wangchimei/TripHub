class Picture < ApplicationRecord
  belongs_to :schedule
  mount_uploaders :images, ImageUploader
end
