class Image < ApplicationRecord
  mount_uploader :link, PhotoUploader
  belongs_to :boyfriend
  validates :link, presence: true
end
