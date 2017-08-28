class Article < ApplicationRecord
  has_many :article_comments
  belongs_to :user

  validates :title, presence: true, length: { maximum: 128 }
  validates :text, presence: true, length: { maximum: 30000 }
end
