class Article < ApplicationRecord

  validates :title, presence: true
  validates :content, presence: true
  validates :slug, presence: true, uniqueness: true

  belongs_to :user, optional: true
  has_many :comments, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }
end
