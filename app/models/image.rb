class Image < ApplicationRecord
  belongs_to :boyfriend

  validates :link, presence: true
end
