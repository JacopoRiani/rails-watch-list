class Movie < ApplicationRecord
  validates :title, :overview, presence: true
  has_many :bookmarks
  has_many :list, through: :bookmarks
end
