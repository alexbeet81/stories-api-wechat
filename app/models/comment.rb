class Comment < ApplicationRecord
  belongs_to :story

  validates :name, presence: true
  validates :content, length: { minimum: 1 }
end
