class Story < ApplicationRecord
  has_many :comments

  validates :name, :text, :image_url, presence: true
end
