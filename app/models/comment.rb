class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true

  validates :content, presence: true
end
