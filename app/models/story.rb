class Story < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, :text, :image_url, presence: true
end
